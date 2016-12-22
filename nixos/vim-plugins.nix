{ pkgs, fetchgit, which }:

# https://github.com/NixOS/nixpkgs/blob/master/pkgs/misc/vim-plugins/default.nix

let
  buildVimPlugin = pkgs.vimUtils.buildVimPluginFrom2Nix;
in {

  "vimproc" = buildVimPlugin {
    name = "vimproc";
    src = fetchgit {
      url = "https://github.com/shougo/vimproc.vim.git";
      rev = "25cb83f24edec4aec1e9f1329302235e7a7a7fe0";
      sha256 = "19nl21623cv05j6ljyn35qm38pw3680nch2by1gapqmxazp99i20";
    };
    dependencies = [];
    buildInputs = [ which ];

    buildPhase = ''
      substituteInPlace autoload/vimproc.vim \
        --replace vimproc_mac.so vimproc_unix.so \
        --replace vimproc_linux64.so vimproc_unix.so \
        --replace vimproc_linux32.so vimproc_unix.so
      make -f make_unix.mak
    '';
  };

  "syntastic" = buildVimPlugin {
    name = "syntastic";
    src = fetchgit {
      url = "https://github.com/vim-syntastic/syntastic.git";
      rev = "734fde7f0b84ff3f670ab5772ed1b8b0c8c16770";
      sha256 = "18nw0zw8h537d189n0z244fllbyyb9fw47brnmsw82w90b771723";
    };
    dependencies = [];
  };

  "nerdtree" = buildVimPlugin {
    name = "nerdtree";
    src = fetchgit {
      url = "https://github.com/scrooloose/nerdtree.git";
      rev = "eee431dbd44111c858c6d33ffd366cae1f17f8b3";
      sha256 = "1fyz3fp2v77piydadcg47pbb7dds9b015kj1baqaxr4gn2gfwq7f";
    };
    dependencies = [];
  };

  "ctrlp" = buildVimPlugin {
    name = "ctrlp";
    src = fetchgit {
      url = "https://github.com/ctrlpvim/ctrlp.vim.git";
      rev = "88b61e77a285d10d0163bd383d3bb2909ea2ddca";
      sha256 = "0zb5hcsbgvbsp5h0alkqyqbikzicl29mraw787p2chbps10n1qjw";
    };
    dependencies = [];
  };

  surround = buildVimPlugin {
    name = "surround";
    src = fetchgit {
      url = "https://github.com/tpope/vim-surround.git";
      rev = "e49d6c2459e0f5569ff2d533b4df995dd7f98313";
      sha256 = "1v0q2f1n8ngbja3wpjvqp2jh89pb5ij731qmm18k41nhgz6hhm46";
    };
    dependencies = [];
  };

  "airline" = buildVimPlugin {
    name = "airline";
    src = fetchgit {
      url = "https://github.com/vim-airline/vim-airline.git";
      rev = "258430db82329c1298750af91391c1b21a5a5b58";
      sha256 = "16m884mfrhmnn12nclmdngkcknkhy1kcn4dhpkk7fs5i89yik1rj";
    };
    dependencies = [];
  };

  "airline-themes" = buildVimPlugin {
    name = "airline-themes";
    src = fetchgit {
      url = "https://github.com/vim-airline/vim-airline-themes.git";
      rev = "e03e9f62d25f9afb04c88ec6ca66cf2098242016";
      sha256 = "0c6qnh7xjp7qiw5hdz4a3n9v4fk7vynm592aqs4cmhhgjfv1s845";
    };
    dependencies = [];
  };

  "fugitive" = buildVimPlugin {
    name = "fugitive";
    src = fetchgit {
      url = "https://github.com/tpope/vim-fugitive.git";
      rev = "b3a8be6975dcc27b523b030bf5d35d9c737aef18";
      sha256 = "1qizj0xmpaj32b9f8p2d76s5rsvm8cxv0rh5yiczlgfvflbi587r";
    };
    dependencies = [];
  };

  "multiple-cursors" = buildVimPlugin {
    name = "multiple-cursors";
    src = fetchgit {
      url = "https://github.com/terryma/vim-multiple-cursors.git";
      rev = "51d0717f63cc231f11b4b63ee5b611f589dce1b3";
      sha256 = "1s06wp4cjdmfvljzd9gz0wawkfcpkj8l2scjdx626ml740pnhmx8";
    };
    dependencies = [];
  };

  "supertab" = buildVimPlugin {
    name = "supertab";
    src = fetchgit {
      url = "https://github.com/ervandew/supertab.git";
      rev = "66511772a430a5eaad7f7d03dbb02e8f33c4a641";
      sha256 = "1kxxgplsc40wyl7yj3dpcjjgysd41cd32ppcpnj5knphpjw7abp4";
    };
    dependencies = [];
  };

  "gitgutter" = buildVimPlugin {
    name = "gitgutter";
    src = fetchgit {
      url = "https://github.com/airblade/vim-gitgutter.git";
      rev = "1742a8f568df549f4daeda90174b54d0c371501f";
      sha256 = "1d4d4lpf43dd5fpn3cqb3lrfr4k6ilmanmk9cymwf9byri3s4xdv";
    };
    dependencies = [];
  };

  "signify" = buildVimPlugin {
    name = "signify";
    src = fetchgit {
      url = "https://github.com/mhinz/vim-signify.git";
      rev = "a7e3219de8f603aaec35b30027778aa417fcb691";
      sha256 = "1dq369s2bavwkv59cklbjz2zr6vk5ahqs53x1pj0l1xx3rg9h3aq";
    };
    dependencies = [];
  };

  "elm" = buildVimPlugin {
    name = "elm";
    src = fetchgit {
      url = "https://github.com/elmcast/elm-vim.git";
      rev = "7760aed9f258cf6a7d2c56d547dd3ea45f832025";
      sha256 = "1f1z2929aka2shkwb8z2ky26cvw2cgx7wdcikw9mljpgc1s7nl5d";
    };
    dependencies = [];
  };

  ghcmod = buildVimPlugin {
    name = "ghcmod";
    src = fetchgit {
      url = "https://github.com/eagletmt/ghcmod-vim";
      rev = "1d192d13d68ab59f9f46497a0909bf24a7b7dfff";
      sha256 = "0bzahgzagnf0a9zv86jhdf8nc3p0yfz9izv5n3lc8gc12cp47d0a";
    };
    dependencies = [];
  };

  necoghc = buildVimPlugin {
    name = "necoghc";
    src = fetchgit {
      url = "https://github.com/eagletmt/neco-ghc";
      rev = "7f02a9c25fb272a87d2be092826e2cd3094c620d";
      sha256 = "1fcfk45qb96h6y4zb3p0104iyqc85q1synn9ah56zp6hnkkyffbw";
    };
    dependencies = [];
  };

  hindent = buildVimPlugin {
    name = "hindent";
    src = fetchgit {
      url = "https://github.com/alx741/vim-hindent.git";
      rev = "d97a94eade5a363dca9d56a8d9970852512c4ec0";
      sha256 = "0gklmyzj7mkpm4sqsxxmah1kxmjlv1s8lr2gya674yb5fz7n10nd";
    };
    dependencies = [];
  };

  "kuvim-themes" = buildVimPlugin {
    name = "kuvim-themes";
    src = fetchgit {
      url = "https://github.com/kuznero/kuvim-themes.git";
      rev = "f6d9986163aa801f144f516946b9821247973c7d";
      sha256 = "1jrcq14mi1l6hayy4y5plm6dqq1vxqkmiww2xx1072dmr73kq7f0";
    };
    dependencies = [];
  };

  "papercolor-theme" = buildVimPlugin {
    name = "papercolor-theme";
    src = fetchgit {
      url = "https://github.com/NLKNguyen/papercolor-theme";
      rev = "2649bb8dbea94a852f78650556152304f5838b14";
      sha256 = "0q47v8rx7p0b7rygbp3agrixqv1dipy07kap5q646c9hfc97vjvk";
    };
    dependencies = [];
  };

  # more?
}
