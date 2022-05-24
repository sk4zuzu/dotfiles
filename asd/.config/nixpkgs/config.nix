{
  allowUnfree = true;
  permittedInsecurePackages = [ "openssl-1.0.2u" ];
  packageOverrides = pkgs: with pkgs; {
    asd =
      let
        python3-with-pkgs = python3.withPackages (python-pkgs: with python-pkgs; [
          #ansible
          ansible-core # 2.12
          pip
          python
          sphinx
          sphinx_rtd_theme
        ]);
        ruby-with-pkgs = ruby.withPackages (ruby-pkgs: with ruby-pkgs; [
          byebug
          faraday
          mail
          net-ssh
          pry
          rake
          rspec
          rubocop
          yard
        ]);
      in buildEnv {
        name = "asd";
        paths = [
          mc htop neovim
          gettext groff lynx pandoc wkhtmltopdf mupdf
          zip unzip libarchive
          bash_5 dash bc which
          curl ncat wget jq yq-go
          lftp

          cdrkit cloud-utils

          docker-compose
          podman-compose

          shellcheck

          stow
          patch
          gitAndTools.git
          gitAndTools.pre-commit

          python3-with-pkgs
          ruby-with-pkgs

          awscli

          nodejs yarn python2Full gcc binutils

          groovy openjdk
        ];
      };
  };
}
