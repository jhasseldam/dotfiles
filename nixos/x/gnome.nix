{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnome3.pomodoro
    gnome3.gconf
    gnome3.gnome-tweak-tool
  ];

  # [org.gnome.desktop.wm.keybindings]
  # activate-window-menu=["<Alt>space"]
  # always-on-top=[""]
  # begin-move=["<Alt>F7"]
  # begin-resize=["<Alt>F8"]
  # close=["<Super><Shift>c", '<Alt>F4']
  # cycle-group-backward=["<Shift><Alt>F6"]
  # cycle-group=["<Alt>F6"]
  # cycle-panels-backward=["<Shift><Control><Alt>Escape"]
  # cycle-panels=["<Control><Alt>Escape"]
  # cycle-windows-backward=["<Shift><Alt>Escape"]
  # cycle-windows=["<Alt>Escape"]
  # lower=[""]
  # maximize-horizontally=["<Super>n"]
  # maximize-vertically=["<Super>y"]
  # maximize=["<Super>Page_Up"]
  # minimize=["<Super>Page_Down"]
  # move-to-center=["<Super>h"]
  # move-to-corner-ne=["<Super>k"]
  # move-to-corner-nw=["<Super>j"]
  # move-to-corner-se=["<Super>semicolon"]
  # move-to-corner-sw=["<Super>l"]
  # move-to-monitor-down=[""]
  # move-to-monitor-left=[""]
  # move-to-monitor-right=[""]
  # move-to-monitor-up=[""]
  # move-to-side-e=[""]
  # move-to-side-n=[""]
  # move-to-side-s=[""]
  # move-to-side-w=[""]
  # move-to-workspace-10=[""]
  # move-to-workspace-11=[""]
  # move-to-workspace-12=[""]
  # move-to-workspace-1=["<Super><Shift>1"]
  # move-to-workspace-2=["<Super><Shift>2"]
  # move-to-workspace-3=["<Super><Shift>3"]
  # move-to-workspace-4=["<Super><Shift>4"]
  # move-to-workspace-5=["<Super><Shift>5"]
  # move-to-workspace-6=["<Super><Shift>6"]
  # move-to-workspace-7=["<Super><Shift>7"]
  # move-to-workspace-8=["<Super><Shift>8"]
  # move-to-workspace-9=["<Super><Shift>9"]
  # move-to-workspace-down=["<Super><Shift>Down"]
  # move-to-workspace-last=[""]
  # move-to-workspace-left=["<Super><Shift>Left"]
  # move-to-workspace-right=["<Super><Shift>Right"]
  # move-to-workspace-up=["<Super><Shift>Up"]
  # panel-main-menu=["<Alt>F1"]
  # panel-run-dialog=["<Alt>F2"]
  # raise-or-lower=[""]
  # raise=[""]
  # set-spew-mark=[""]
  # show-desktop=[""]
  # switch-applications-backward=["<Shift><Super>Tab", '<Shift><Alt>Tab']
  # switch-applications=["<Super>Tab", '<Alt>Tab']
  # switch-group-backward=["<Shift><Super>Above_Tab", '<Shift><Alt>Above_Tab']
  # switch-group=["<Super>Above_Tab", '<Alt>Above_Tab']
  # switch-input-source-backward=[""]
  # switch-input-source=[""]
  # switch-panels-backward=["<Shift><Control><Alt>Tab"]
  # switch-panels=["<Control><Alt>Tab"]
  # switch-to-workspace-10=[""]
  # switch-to-workspace-11=[""]
  # switch-to-workspace-12=[""]
  # switch-to-workspace-1=["<Super>1"]
  # switch-to-workspace-2=["<Super>2"]
  # switch-to-workspace-3=["<Super>3"]
  # switch-to-workspace-4=["<Super>4"]
  # switch-to-workspace-5=["<Super>5"]
  # switch-to-workspace-6=["<Super>6"]
  # switch-to-workspace-7=["<Super>7"]
  # switch-to-workspace-8=["<Super>8"]
  # switch-to-workspace-9=["<Super>9"]
  # switch-to-workspace-down=["<Super>Down"]
  # switch-to-workspace-last=["<Super>End"]
  # switch-to-workspace-left=["<Super>Left"]
  # switch-to-workspace-right=["<Super>Right"]
  # switch-to-workspace-up=["<Super>Up"]
  # switch-windows-backward=[""]
  # switch-windows=[""]
  # toggle-above=["<Super><Shift>h"]
  # toggle-fullscreen=[""]
  # toggle-maximized=["<Super>space"]
  # toggle-on-all-workspaces=[""]
  # toggle-shaded=[""]
  # unmaximize=["<Super>Down", '<Alt>F5']

  services = {
    openssh.enable = true;
    printing = {
      enable = true;
      drivers = [ pkgs.gutenprint ];
    };
    xserver = {
      enable = true;
      layout = "us";
      displayManager.gdm.enable = true;
      desktopManager.gnome3 = {
        enable = true;
        extraGSettingsOverrides = ''
[org.gnome.nautilus.preferences]
search-view='icon-view'
default-folder-viewer='icon-view'
search-filter-time-type='last_modified'
sort-directories-first=true

[org.gnome.nautilus.window-state]
maximized=false

[org.gnome.nautilus.icon-view]
default-zoom-level='standard'

[org.gnome.nautilus.list-view]
default-visible-columns=['name', 'size', 'date_modified']
default-zoom-level='standard'
default-column-order=['name', 'size', 'type', 'owner', 'group', 'permissions', 'mime_type', 'where', 'date_modified', 'date_modified_with_time', 'date_accessed']

[org.gnome.settings-daemon.peripherals.keyboard]
numlock-state='on'

[org.gnome.settings-daemon.plugins.media-keys]
custom-keybindings=['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/']

[org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom2]
binding='<Primary><Alt>e'
command='nautilus'
name='Files'

[org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom1]
binding='<Primary><Alt>b'
command='firefox'
name='Browser'

[org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom0]
binding='<Primary><Alt>t'
command='gnome-terminal'
name='Terminal'

[org.gnome.terminal.legacy]
mnemonics-enabled=true
schema-version=uint32 3
default-show-menubar=false

[org.gnome.terminal.legacy.profiles:.:d885a970-eb13-4158-ad0d-1fd89f2d749a]
foreground-color='#C7C7C7C7C7C7'
visible-name='peppermint'
palette=['#353535353535', '#E6E645456969', '#8989D2D28787', '#DADAB7B75252', '#43439E9ECFCF', '#D9D96161DCDC', '#6464AAAAAFAF', '#B3B3B3B3B3B3', '#535353535353', '#E4E485859A9A', '#A2A2CCCCA1A1', '#E1E1E3E38787', '#6F6FBBBBE2E2', '#E5E58686E7E7', '#9696DCDCDADA', '#DEDEDEDEDEDE']
custom-command='tmux'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Fira Mono 12'
allow-bold=false
use-theme-background=false
bold-color-same-as-fg=true
bold-color='#B3B3B3B3B3B3'
background-color='#000000000000'

[org.gnome.terminal.legacy.profiles:.:153881c2-5d90-4273-87f1-7174fb90188e]
foreground-color='#b4b4e1e1fdfd'
visible-name='aco'
palette=['#3f3f3f3f3f3f', '#ffff08088383', '#8383ffff0808', '#ffff83830808', '#08088383ffff', '#83830808ffff', '#0808ffff8383', '#bebebebebebe', '#474747474747', '#ffff1e1e8e8e', '#8e8effff1e1e', '#ffff8e8e1e1e', '#1e1e8e8effff', '#8e8e1e1effff', '#1e1effff8e8e', '#c4c4c4c4c4c4']
custom-command='tmux'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Fira Mono 12'
allow-bold=false
use-theme-background=false
bold-color-same-as-fg=true
bold-color='#bebebebebebe'
background-color='#1f1f13130505'

[org.gnome.terminal.legacy.profiles:]
list=['ce90b1c2-06a9-4363-b0dc-5a091c5338b2', '93c63839-ec6b-45a6-9638-98f439300436', '1e862ef8-5203-4c74-aa42-accbc19ea3aa', '8072f016-e93a-4c2e-97b9-c91b3d133d3b', 'f286163b-4cb4-4c9e-9ffb-1355d1b7ff6e', '27d9c405-96f8-468c-9575-80aa7e5a226b', '5b54865f-afec-42af-97ba-77664d594c60', '11b1ac28-77ae-477d-8b17-a030de866f92', '2cdfa098-e4fe-401c-accf-8faa3506897e', '444b7c69-4d98-42fd-8113-21ef430c1045', 'ddccb70c-caac-4d66-80bc-4d6428b61ec5', '2df26ee3-46e0-447a-be7c-a35a88d01371', '153881c2-5d90-4273-87f1-7174fb90188e', '4b524d47-bd73-4dd3-bf01-97aa0194bdf5', '9b08589c-4ffc-4a75-a30c-530469e1baf8', 'dc15bc24-34a8-4995-b369-bda51d67cc60', '8001f286-e571-4bb8-9667-2f0a91f7e32d', '97c79b63-8564-49b2-a455-451506166f59', 'e3deb3fb-c9f5-4118-8718-3c0152712696', 'be1fc032-84e1-4139-b636-867cfad878d6', '53b6f3a5-81fd-4758-8770-11085535a8cc', '67c236d8-e1a0-46af-9150-cf437986d33a', '5b664499-46b5-481b-a6cc-c4f93a506b89', '220685fc-b41e-4c91-ab1f-c3b6e1564b1c', 'd885a970-eb13-4158-ad0d-1fd89f2d749a', '03a7fafe-832e-4f70-973d-2d5c4487a5ff', '48031313-89be-4f81-802f-76d1cb613c07', '390f5f50-5aa5-4058-9d22-b28c08d7ae22']
default='5b54865f-afec-42af-97ba-77664d594c60'

[org.gnome.terminal.legacy.profiles:.:ddccb70c-caac-4d66-80bc-4d6428b61ec5]
foreground-color='#FFFFFEFEFEFE'
visible-name='tomorrow-night-blue'
palette=['#000000000000', '#FFFF9D9DA3A3', '#D1D1F1F1A9A9', '#FFFFEEEEADAD', '#BBBBDADAFFFF', '#EBEBBBBBFFFF', '#9999FFFFFFFF', '#FFFFFEFEFEFE', '#000000000000', '#FFFF9C9CA3A3', '#D0D0F0F0A8A8', '#FFFFEDEDACAC', '#BABADADAFFFF', '#EBEBBABAFFFF', '#9999FFFFFFFF', '#FFFFFEFEFEFE']
custom-command='tmux'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Fira Mono 12'
allow-bold=false
use-theme-background=false
bold-color-same-as-fg=true
bold-color='#FFFFFEFEFEFE'
background-color='#000024245151'

[org.gnome.terminal.legacy.profiles:.:5b54865f-afec-42af-97ba-77664d594c60]
foreground-color='#2A2A2B2B3232'
visible-name='one-light'
palette=['#000000000000', '#DADA3E3E3939', '#414193933E3E', '#858555550404', '#31315E5EEEEE', '#939300009292', '#0E0E6F6FADAD', '#8E8E8F8F9696', '#2A2A2B2B3232', '#DADA3E3E3939', '#414193933E3E', '#858555550404', '#31315E5EEEEE', '#939300009292', '#0E0E6F6FADAD', '#FFFFFEFEFEFE']
custom-command='tmux'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Fira Mono 12'
allow-bold=false
use-theme-background=false
bold-color-same-as-fg=true
bold-color='#8E8E8F8F9696'
background-color='#F8F8F8F8F8F8'
audible-bell=false

[org.gnome.terminal.legacy.profiles:.:9b08589c-4ffc-4a75-a30c-530469e1baf8]
foreground-color='#C5C5C8C8C6C6'
visible-name='tomorrow-night'
palette=['#000000000000', '#CCCC66666666', '#B5B5BDBD6868', '#F0F0C6C67474', '#8181A2A2BEBE', '#B2B29393BBBB', '#8A8ABEBEB7B7', '#FFFFFEFEFEFE', '#000000000000', '#CCCC66666666', '#B5B5BDBD6868', '#F0F0C5C57474', '#8080A1A1BDBD', '#B2B29494BABA', '#8A8ABDBDB6B6', '#FFFFFEFEFEFE']
custom-command='tmux'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Fira Mono 12'
allow-bold=false
use-theme-background=false
bold-color-same-as-fg=true
bold-color='#FFFFFEFEFEFE'
background-color='#1D1D1F1F2121'

[org.gnome.terminal.legacy.profiles:.:11b1ac28-77ae-477d-8b17-a030de866f92]
foreground-color='#5C5C63637070'
visible-name='one-dark'
palette=['#000000000000', '#E0E06C6C7575', '#9898C3C37979', '#D1D19A9A6666', '#6161AFAFEFEF', '#C6C67878DDDD', '#5656B6B6C2C2', '#ABABB2B2BFBF', '#5C5C63637070', '#E0E06C6C7575', '#9898C3C37979', '#D1D19A9A6666', '#6161AFAFEFEF', '#C6C67878DDDD', '#5656B6B6C2C2', '#FFFFFEFEFEFE']
custom-command='tmux'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Fira Mono 12'
allow-bold=false
use-theme-background=false
bold-color-same-as-fg=true
bold-color='#ABABB2B2BFBF'
background-color='#1E1E21212727'

[org.gnome.terminal.legacy.profiles:.:2cdfa098-e4fe-401c-accf-8faa3506897e]
foreground-color='#d9d9e6e6f2f2'
visible-name='cai'
palette=['#000000000000', '#caca27274d4d', '#4d4dcaca2727', '#cacaa4a42727', '#27274d4dcaca', '#a4a42727caca', '#2727cacaa4a4', '#808080808080', '#808080808080', '#e9e98d8da3a3', '#a3a3e9e98d8d', '#e9e9d4d48d8d', '#8d8da3a3e9e9', '#d4d48d8de9e9', '#8d8de9e9d4d4', '#ffffffffffff']
custom-command='tmux'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Fira Mono 12'
allow-bold=false
use-theme-background=false
bold-color-same-as-fg=true
bold-color='#808080808080'
background-color='#090911111a1a'

[org.gnome.terminal.legacy.profiles:.:be1fc032-84e1-4139-b636-867cfad878d6]
foreground-color='#1a1abcbc9c9c'
visible-name='flat'
palette=['#2c2c3e3e5050', '#c0c039392b2b', '#2727aeae6060', '#f3f39c9c1212', '#29298080b9b9', '#8e8e4444adad', '#1616a0a08585', '#bdbdc3c3c7c7', '#343449495e5e', '#e7e74c4c3c3c', '#2e2ecccc7171', '#f1f1c4c40f0f', '#34349898dbdb', '#9b9b5959b6b6', '#2A2AA1A19898', '#ececf0f0f1f1']
custom-command='tmux'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Fira Mono 12'
allow-bold=false
use-theme-background=false
bold-color-same-as-fg=true
bold-color='#bdbdc3c3c7c7'
background-color='#1F1F2D2D3A3A'

[org.gnome.terminal.legacy.profiles:.:f286163b-4cb4-4c9e-9ffb-1355d1b7ff6e]
foreground-color='#9494a3a3a5a5'
visible-name='freya'
palette=['#070736364242', '#dcdc32322f2f', '#858599990000', '#b5b589890000', '#26268b8bd2d2', '#ecec00004848', '#2a2aa1a19898', '#9494a3a3a5a5', '#58586e6e7575', '#cbcb4b4b1616', '#858599990000', '#b5b589890000', '#26268b8bd2d2', '#d3d336368282', '#2a2aa1a19898', '#6c6c7171c4c4']
custom-command='tmux'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Fira Mono 12'
allow-bold=false
use-theme-background=false
bold-color-same-as-fg=true
bold-color='#9494a3a3a5a5'
background-color='#25252e2e3232'

[org.gnome.terminal.legacy.profiles:.:67c236d8-e1a0-46af-9150-cf437986d33a]
foreground-color='#9494A3A3A5A5'
visible-name='dracula'
palette=['#444447475a5a', '#ffff55555555', '#5050fafa7b7b', '#ffffb8b86c6c', '#8b8be9e9fdfd', '#bdbd9393f9f9', '#ffff7979c6c6', '#9494A3A3A5A5', '#000000000000', '#ffff55555555', '#5050fafa7b7b', '#ffffb8b86c6c', '#8b8be9e9fdfd', '#bdbd9393f9f9', '#ffff7979c6c6', '#ffffffffffff']
custom-command='tmux'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Fira Mono 12'
allow-bold=false
use-theme-background=false
bold-color-same-as-fg=true
bold-color='#9494A3A3A5A5'
background-color='#28282a2a3636'

[org.gnome.terminal.legacy.profiles:.:4b524d47-bd73-4dd3-bf01-97aa0194bdf5]
foreground-color='#a9a9bebed8d8'
visible-name='bim'
palette=['#2c2c24242323', '#f5f55757a0a0', '#a9a9eeee5555', '#f5f5a2a25555', '#5e5ea2a2ecec', '#a9a95757ecec', '#5e5eeeeea0a0', '#919189898888', '#919189898888', '#f5f57979b2b2', '#bbbbeeee7878', '#f5f5b3b37878', '#8181b3b3ecec', '#bbbb7979ecec', '#8181eeeeb2b2', '#f5f5eeeeecec']
custom-command='tmux'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Fira Mono 12'
allow-bold=false
use-theme-background=false
bold-color-same-as-fg=true
bold-color='#919189898888'
background-color='#010128284949'

[org.gnome.terminal.legacy.profiles:.:dc15bc24-34a8-4995-b369-bda51d67cc60]
foreground-color='#F7F7F7F7F7F7'
visible-name='smyck'
palette=['#000000000000', '#C7C756564646', '#8E8EB3B33B3B', '#D0D0B0B03C3C', '#7272B3B3CCCC', '#C8C8A0A0D1D1', '#212186869393', '#B0B0B0B0B0B0', '#5D5D5D5D5D5D', '#E0E096969090', '#CDCDEEEE6969', '#FFFFE3E37777', '#9C9CD9D9F0F0', '#FBFBB1B1F9F9', '#7777DFDFD8D8', '#F7F7F7F7F7F7']
custom-command='tmux'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Fira Mono 12'
allow-bold=false
use-theme-background=false
bold-color-same-as-fg=true
bold-color='#B0B0B0B0B0B0'
background-color='#242424242424'

[org.gnome.terminal.legacy.profiles:.:ce90b1c2-06a9-4363-b0dc-5a091c5338b2]
foreground-color='#ebebdbdbb2b2'
visible-name='gruvbox'
palette=['#66665c5c5454', '#fbfb49493434', '#8383a5a59898', '#d7d799992121', '#b1b162628686', '#454585858888', '#b8b8bbbb2626', '#d6d65d5d0e0e', '#a8a899998484', '#fbfb49493434', '#8e8ec0c07c7c', '#fafabdbd2f2f', '#d3d386869b9b', '#68689d9d6a6a', '#989897971a1a', '#fefe80801919']
custom-command='tmux'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Fira Mono 12'
allow-bold=false
use-theme-background=false
bold-color-same-as-fg=true
bold-color='#d6d65d5d0e0e'
background-color='#282828282828'

[org.gnome.terminal.legacy.profiles:.:220685fc-b41e-4c91-ab1f-c3b6e1564b1c]
foreground-color='#ffffffffffff'
visible-name='tin'
palette=['#000000000000', '#8d8d53534e4e', '#4e4e8d8d5353', '#88888d8d4e4e', '#53534e4e8d8d', '#8d8d4e4e8888', '#4e4e88888d8d', '#ffffffffffff', '#000000000000', '#b5b57d7d7878', '#7878b5b57d7d', '#b0b0b5b57878', '#7d7d7878b5b5', '#b5b57878b0b0', '#7878b0b0b5b5', '#ffffffffffff']
custom-command='tmux'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Fira Mono 12'
allow-bold=false
use-theme-background=false
bold-color-same-as-fg=true
bold-color='#ffffffffffff'
background-color='#2e2e2e2e3535'

[org.gnome.terminal.legacy.profiles:.:2df26ee3-46e0-447a-be7c-a35a88d01371]
foreground-color='#f2f2f2f2f2f2'
visible-name='elio'
palette=['#303030303030', '#e1e132321a1a', '#6a6ab0b01717', '#ffffc0c00505', '#72729F9FCFCF', '#ecec00004848', '#2a2aa7a7e7e7', '#f2f2f2f2f2f2', '#5d5d5d5d5d5d', '#ffff36361e1e', '#7b7bc9c91f1f', '#ffffd0d00a0a', '#00007171ffff', '#ffff1d1d6262', '#4b4bb8b8fdfd', '#a0a02020f0f0']
custom-command='tmux'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Fira Mono 12'
allow-bold=false
use-theme-background=false
bold-color-same-as-fg=true
bold-color='#f2f2f2f2f2f2'
background-color='#04041A1A3B3B'

[org.gnome.terminal.legacy.profiles:.:27d9c405-96f8-468c-9575-80aa7e5a226b]
foreground-color='#f8f8f8f8f2f2'
visible-name='monokai'
palette=['#757571715e5e', '#f9f926267272', '#a6a6e2e22e2e', '#f4f4bfbf7575', '#6666d9d9efef', '#aeae8181ffff', '#2A2AA1A19898', '#f9f9f8f8f5f5', '#272728282222', '#f9f926267272', '#a6a6e2e22e2e', '#f4f4bfbf7575', '#6666d9d9efef', '#aeae8181ffff', '#2A2AA1A19898', '#f8f8f8f8f2f2']
custom-command='tmux'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Fira Mono 12'
allow-bold=false
use-theme-background=false
bold-color-same-as-fg=true
bold-color='#f9f9f8f8f5f5'
background-color='#272728282222'

[org.gnome.terminal.legacy.profiles:.:8072f016-e93a-4c2e-97b9-c91b3d133d3b]
foreground-color='#48488282cdcd'
visible-name='shel'
palette=['#2c2c24242323', '#abab24246363', '#6c6ca3a32323', '#abab64642323', '#2c2c6464a2a2', '#6c6c2424a2a2', '#2c2ca3a36363', '#919189898888', '#919189898888', '#f5f58888b9b9', '#c2c2eeee8686', '#f5f5baba8686', '#8f8fbabaecec', '#c2c28888ecec', '#8f8feeeeb9b9', '#f5f5eeeeecec']
custom-command='tmux'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Fira Mono 12'
allow-bold=false
use-theme-background=false
bold-color-same-as-fg=true
bold-color='#919189898888'
background-color='#2a2a20201f1f'

[org.gnome.terminal.legacy.profiles:.:8001f286-e571-4bb8-9667-2f0a91f7e32d]
foreground-color='#d9d9e6e6f2f2'
visible-name='pali'
palette=['#0a0a0a0a0a0a', '#abab8f8f7474', '#7474abab8f8f', '#8f8fabab7474', '#8f8f7474abab', '#abab74748f8f', '#74748f8fabab', '#F2F2F2F2F2F2', '#5D5D5D5D5D5D', '#FFFF1D1D6262', '#9c9cc3c3afaf', '#FFFFD0D00A0A', '#afaf9c9cc3c3', '#FFFF1D1D6262', '#4B4BB8B8FDFD', '#A0A02020F0F0']
custom-command='tmux'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Fira Mono 12'
allow-bold=false
use-theme-background=false
bold-color-same-as-fg=true
bold-color='#F2F2F2F2F2F2'
background-color='#23232E2E3737'

[org.gnome.terminal.legacy.profiles:.:1e862ef8-5203-4c74-aa42-accbc19ea3aa]
foreground-color='#f2f2f2f2f2f2'
visible-name='elementary'
palette=['#303030303030', '#e1e132321a1a', '#6a6ab0b01717', '#ffffc0c00505', '#00004f4f9e9e', '#ecec00004848', '#2a2aa7a7e7e7', '#f2f2f2f2f2f2', '#5d5d5d5d5d5d', '#ffff36361e1e', '#7b7bc9c91f1f', '#ffffd0d00a0a', '#00007171ffff', '#ffff1d1d6262', '#4b4bb8b8fdfd', '#a0a02020f0f0']
custom-command='tmux'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Fira Mono 12'
allow-bold=false
use-theme-background=false
bold-color-same-as-fg=true
bold-color='#f2f2f2f2f2f2'
background-color='#101010101010'

[org.gnome.terminal.legacy.profiles:.:48031313-89be-4f81-802f-76d1cb613c07]
foreground-color='#838394949696'
visible-name='solarized-dark'
palette=['#070736364242', '#DCDC32322F2F', '#858599990000', '#B5B589890000', '#26268B8BD2D2', '#D3D336368282', '#2A2AA1A19898', '#EEEEE8E8D5D5', '#00002B2B3636', '#CBCB4B4B1616', '#58586E6E7575', '#65657B7B8383', '#838394949696', '#6C6C7171C4C4', '#9393A1A1A1A1', '#FDFDF6F6E3E3']
custom-command='tmux'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Fira Mono 12'
allow-bold=false
use-theme-background=false
bold-color-same-as-fg=false
bold-color='#93A1A1'
background-color='#00002B2B3636'

[org.gnome.terminal.legacy.profiles:.:e3deb3fb-c9f5-4118-8718-3c0152712696]
foreground-color='#232347476a6a'
visible-name='mar'
palette=['#000000000000', '#b5b540407b7b', '#7b7bb5b54040', '#b5b57b7b4040', '#40407b7bb5b5', '#7b7b4040b5b5', '#4040b5b57b7b', '#f8f8f8f8f8f8', '#737373737373', '#cdcd7373a0a0', '#a0a0cdcd7373', '#cdcda0a07373', '#7373a0a0cdcd', '#a0a07373cdcd', '#7373cdcda0a0', '#ffffffffffff']
custom-command='tmux'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Fira Mono 12'
allow-bold=false
use-theme-background=false
bold-color-same-as-fg=true
bold-color='#f8f8f8f8f8f8'
background-color='#ffffffffffff'
audible-bell=false

[org.gnome.terminal.legacy.profiles:.:5b664499-46b5-481b-a6cc-c4f93a506b89]
foreground-color='#D4D4D4D4D4D4'
visible-name='chalk'
palette=['#646464646464', '#F5F58E8E8E8E', '#A9A9D3D3ABAB', '#FEFED3D37E7E', '#7A7AABABD4D4', '#D6D6ADADD5D5', '#7979D4D4D5D5', '#D4D4D4D4D4D4', '#646464646464', '#F5F58E8E8E8E', '#A9A9D3D3ABAB', '#FEFED3D37E7E', '#7A7AABABD4D4', '#D6D6ADADD5D5', '#7979D4D4D5D5', '#D4D4D4D4D4D4']
custom-command='tmux'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Fira Mono 12'
allow-bold=false
use-theme-background=false
bold-color-same-as-fg=true
bold-color='#D4D4D4D4D4D4'
background-color='#2D2D2D2D2D2D'

[org.gnome.terminal.legacy.profiles:.:97c79b63-8564-49b2-a455-451506166f59]
foreground-color='#97979C9CACAC'
visible-name='ocean'
palette=['#4F4F4F4F4F4F', '#AFAF4B4B5757', '#AFAFD3D38383', '#E5E5C0C07979', '#7D7D9090A4A4', '#A4A479799D9D', '#8585A6A6A5A5', '#EEEEEDEDEEEE', '#7B7B7B7B7B7B', '#AFAF4B4B5757', '#CECEFFFFABAB', '#FFFFFEFECCCC', '#B5B5DCDCFEFE', '#FBFB9B9BFEFE', '#DFDFDFDFFDFD', '#FEFEFFFFFEFE']
custom-command='tmux'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Fira Mono 12'
allow-bold=false
use-theme-background=false
bold-color-same-as-fg=true
bold-color='#EEEEEDEDEEEE'
background-color='#1C1C1F1F2727'

[org.gnome.terminal.legacy.profiles:.:03a7fafe-832e-4f70-973d-2d5c4487a5ff]
foreground-color='#65657B7B8383'
visible-name='solarized-light'
palette=['#070736364242', '#DCDC32322F2F', '#858599990000', '#B5B589890000', '#26268B8BD2D2', '#D3D336368282', '#2A2AA1A19898', '#EEEEE8E8D5D5', '#00002B2B3636', '#CBCB4B4B1616', '#58586E6E7575', '#65657B7B8383', '#838394949696', '#6C6C7171C4C4', '#9393A1A1A1A1', '#FDFDF6F6E3E3']
custom-command='tmux'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Fira Mono 12'
allow-bold=false
use-theme-background=false
bold-color-same-as-fg=false
bold-color='#586E75'
background-color='#FDFDF6F6E3E3'

[org.gnome.terminal.legacy.profiles:.:93c63839-ec6b-45a6-9638-98f439300436]
foreground-color='#E9E9E9E9E9E9'
visible-name='tomorrow-night-bright'
palette=['#000000000000', '#D5D54E4E5353', '#B9B9CACA4949', '#E7E7C5C54747', '#7979A6A6DADA', '#C3C39797D8D8', '#7070C0C0B1B1', '#FFFFFEFEFEFE', '#000000000000', '#D4D44D4D5353', '#B9B9C9C94949', '#E6E6C4C44646', '#7979A6A6DADA', '#C3C39696D7D7', '#7070C0C0B1B1', '#FFFFFEFEFEFE']
custom-command='tmux'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Fira Mono 12'
allow-bold=false
use-theme-background=false
bold-color-same-as-fg=true
bold-color='#FFFFFEFEFEFE'
background-color='#000000000000'

[org.gnome.terminal.legacy.profiles:.:444b7c69-4d98-42fd-8113-21ef430c1045]
foreground-color='#d9d9e6e6f2f2'
visible-name='vag'
palette=['#303030303030', '#a8a871713939', '#3939a8a87171', '#7171a8a83939', '#71713939a8a8', '#a8a839397171', '#39397171a8a8', '#8a8a8a8a8a8a', '#494949494949', '#b0b076763b3b', '#3b3bb0b07676', '#7676b0b03b3b', '#76763b3bb0b0', '#b0b03b3b7676', '#3b3b7676b0b0', '#cfcfcfcfcfcf']
custom-command='tmux'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Fira Mono 12'
allow-bold=false
use-theme-background=false
bold-color-same-as-fg=true
bold-color='#8a8a8a8a8a8a'
background-color='#19191f1f1d1d'

[org.gnome.terminal.legacy.profiles:.:53b6f3a5-81fd-4758-8770-11085535a8cc]
foreground-color='#4D4D4D4D4C4C'
visible-name='tomorrow'
palette=['#000000000000', '#C8C828282828', '#71718C8C0000', '#EAEAB7B70000', '#41417171AEAE', '#89895959A8A8', '#3E3E99999F9F', '#FFFFFEFEFEFE', '#000000000000', '#C8C828282828', '#70708B8B0000', '#E9E9B6B60000', '#41417070AEAE', '#89895858A7A7', '#3D3D99999F9F', '#FFFFFEFEFEFE']
custom-command='tmux'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Fira Mono 12'
allow-bold=false
use-theme-background=false
bold-color-same-as-fg=true
bold-color='#FFFFFEFEFEFE'
background-color='#FFFFFFFFFFFF'

[org.gnome.terminal.legacy.profiles:.:390f5f50-5aa5-4058-9d22-b28c08d7ae22]
foreground-color='#b4b4e1e1fdfd'
visible-name='aci'
palette=['#363636363636', '#ffff08088383', '#8383ffff0808', '#ffff83830808', '#08088383ffff', '#83830808ffff', '#0808ffff8383', '#b6b6b6b6b6b6', '#424242424242', '#ffff1e1e8e8e', '#8e8effff1e1e', '#ffff8e8e1e1e', '#1e1e8e8effff', '#8e8e1e1effff', '#1e1effff8e8e', '#c2c2c2c2c2c2']
custom-command='tmux'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Fira Mono 12'
allow-bold=false
use-theme-background=false
bold-color-same-as-fg=true
bold-color='#b6b6b6b6b6b6'
background-color='#0d0d19192626'

[org.gnome.desktop.peripherals.touchpad]
tap-to-click=true

[org.gnome.desktop.interface]
close-show-date=true
cursor-theme='capitaine-cursors'
enable-animations=true
        '';
        sessionPath = with pkgs.gnome3; [ pomodoro ];
      };
    };
    gnome3.gnome-keyring.enable = true;
    udisks2.enable = true;
  };

  system.activationScripts = {
    gnomeDotfiles = {
      text = ''
        cd /home/kuznero
        if [[ -d .icons/capitaine-cursors ]]; then rm -rf .icons/capitaine-cursors; fi
        if [[ ! -d .icons ]]; then mkdir .icons; fi
        ln -s /etc/nixos/dotfiles/.icons/capitaine-cursors .icons/capitaine-cursors
      '';
      deps = ["users"];
    };
  };

}
