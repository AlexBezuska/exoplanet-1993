# Coincidence of Occlusion


a game by: Imran Bharadia, Glenn Essex, Wren Slaven, EJ Curtis, fufroom (Alex Bezuska), and Aaron Goodwine



## Color Pallete:

PC Desktop background:  Dark Purple. RGB (130,53,109)


---

## VS Code autocomplete

- Lua Language Server (IntelliSense): https://marketplace.visualstudio.com/items?itemName=sumneko.lua
- Love2D snippets/helpers: https://marketplace.visualstudio.com/items?itemName=pixelbyte-studios.pixelbyte-love2d



## git stuff!

Add all of your files you changed:

```
git add . 
```

--- 
```
git commit -m "whatever your commit message is" 
```

---
Pull the changes other people made

```
git pull --rebase
```


## Build a .love (zip)


If you have Git installed, this creates a clean zip without `.git/` and works the same on macOS/Linux/Windows:

```sh
git archive --format=zip --output exoplanet-1993.love HEAD
```
