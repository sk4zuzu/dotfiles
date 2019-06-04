
import Control.Applicative
import Data.Default
import Data.Monoid
import Data.Bits ( (.|.) ) 

import System.Posix.User ( getRealUserID )

import XMonad
import XMonad.Layout.ShowWName
import XMonad.Layout.NoBorders
import XMonad.Layout.HintedGrid
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageHelpers
import XMonad.Actions.Plane
import XMonad.Actions.SpawnOn
import XMonad.Actions.WindowGo
import XMonad.Util.CustomKeys
import XMonad.Util.Run

import qualified Data.Map as M
import qualified XMonad.StackSet as W


spawnOnUnless :: Query Bool -> WorkspaceId -> String -> X ()
spawnOnUnless qry ws cmd = ifWindow qry idHook $ spawnOn ws cmd


spawnUnless :: String -> [String] -> X ()
spawnUnless cmd args = do
    realUserID <- io $ show <$> getRealUserID
    output <- runProcessWithInput "pgrep" ["-u", realUserID, cmd] mempty
    if null output then safeSpawn cmd args
                   else io . putStrLn $ "Nooo...!"


myStartupHook = setWMName "LG3D"
             >> spawn "xrandr.sh"
             >> spawnUnless "pulseaudio" ["--start"]
             >> spawnUnless "redshift" mempty
             >> spawnOnUnless (className =? "Chromium-browser") "2" "chromium-browser"
             >> spawnOnUnless (className =? "Pavucontrol"     ) "1" "pavucontrol"


myLayoutHook = showWName
             . smartBorders
             $ Grid False ||| Grid True ||| Full


myManageHook = (isFullscreen --> doFullFloat)
            <+> manageSpawn


myKeys = customKeys delkeys inskeys
    where
        delkeys XConfig {modMask = modm} = mempty
            <+> [(modm, n) | n <- [xK_1 .. xK_9]]
            <+> [(modm, xK_Return)]
            <+> [(modm, xK_space)]

        inskeys conf@(XConfig {modMask = modm}) = mempty
            <+> [((m .|. modm, k), windows $ f i) | (i, k) <- zip (workspaces conf) [xK_F1 .. xK_F8]
                                                  , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]] 
            <+> [((modm .|. controlMask, xK_Return), windows W.swapMaster)]
            <+> [((modm .|. controlMask, xK_space), sendMessage NextLayout)]
            <+> [((mod4Mask, xK_l), spawn "slock.sh")]
            <+> M.toList (planeKeys (modm .|. controlMask) (Lines 4) Circular)


main = xmonad $ def
    { borderWidth        = 1
    , workspaces         = ["1", "2", "3", "4", "5", "6", "7", "8"]
    , terminal           = "urxvt"
    , normalBorderColor  = "#000000"
    , focusedBorderColor = "#cd8b00"
    , startupHook        = myStartupHook
    , layoutHook         = myLayoutHook
    , manageHook         = myManageHook
    , keys               = myKeys }


-- vim:ts=4:sw=4:et:
