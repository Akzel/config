##### some of these commands might work :)

HE'S GONE AND DONE IT, 
Working on two computers so far!

to use, clone whereever, 
`nix-shell -p stow gnumake`

`cd dots`\
all: `stow . -t ~/.config/`\
or some: `stow hypr kitty -t ~/.config/`

note `.zshrc` goes to `~/` instead 🤷‍♂️

`nixos-generate-config` to get hw config\
`cp /etc/nixos/hardware-configuarion.nix {hw-whatever,nix}`

Remember flakes need to have everything in the git to work
soooo `git add .`

 and finally... assuming everything is good..\
 `make hisoka`/`make killua`
 
 ....profit?
