# Tower Defense game - Hacktoberfest 2020

![game logo](https://github.com/crystal-bit/hacktoberfest-2020/blob/master/assets/menu_title_shadow.png?raw=true)


**Defending Todot** it's an open source tower defense game inspired by Kingdom Rush.  

It has been created for people who want to practice game development collaboratively while partecipating to the [Hacktoberfest](https://hacktoberfest.digitalocean.com/) 2020.

The project is made with the open source [Godot Engine v3.2.3](https://godotengine.org).

## 🎮 Play it now

- [Browser HTML5](https://crystal-bit.github.io/hacktoberfest-2020/)
- [Linux / Windows / Mac builds](https://github.com/crystal-bit/hacktoberfest-2020/releases/tag/2020.11.01)

## Discuss with the community

![Discord](https://img.shields.io/discord/686600734636376102?logo=discord&logoColor=ffffff&color=7389D8&labelColor=6A7EC2)

Join [the Discord server](https://discord.gg/SA6S2Db)

## "How can I contribute?"

You can:

- **[Open a new issue](https://github.com/crystal-bit/space-shooter/issues/new)**: do you have an idea for the gameplay? Do you want to suggest an improvement? Do you want to create new assets like sprites, sounds, effects,...? Did you find a bug? Open a new issue and let other developers know.
- **[Take an issue](https://github.com/crystal-bit/hacktoberfest-2020/issues)**: work on existing issues. Read below for guidelines.

### How to take an issue ⤵️

1. ➡️ **Write a short message** in the issue itself to notify others that you are working on it. (I'll assign the issue to your Github user)
2. ➡️ **Ask for help** if you have any doubt.
   - Ask for help in the issue itself
   - Ask on the Discord server - https://discord.gg/SA6S2Db
   - Ask during a livestream - [twitch.tv/crystal_bit](https://www.twitch.tv/crystal_bit) (feel free to ask in English, Spanish or Italian)
3. ➡️ **Happy coding**! I hope you will learn a lot during the process!

I hope these rules will help everyone having an enjoyable Hacktoberfest.

## How to appear in the game credits

Before making a pull request, consider adding yourself to the [credits.gd](https://github.com/crystal-bit/hacktoberfest-2020/blob/master/scenes/credits.gd) script so that you will appear in the game credits!

## Project conventions

### Lower case letters only for filenames

To avoid issues when multiple contributors are working on the same project across various
file systems and operating systems. See more details [here](https://github.com/crystal-bit/godot-game-template#lower-case-letters-only).

### Node names

Use `CamelCase` style for node names.  
This is the default style used in Godot and, moreover, it's easier to reference node names which don't have dash symbol or whitespaces in their name (see [this comment](https://github.com/crystal-bit/hacktoberfest-2020/pull/21#issuecomment-703162481))

### Code style

There are no strict requirements on code style, but try to be consistent with the code that you'll find.

Ideally the code should follow [the official GDScript style guide](http://docs.godotengine.org/en/latest/getting_started/scripting/gdscript/gdscript_styleguide.html).

For the order of variables, signals, functions, please follow this order (simplified from [GDQuest's guidelines](https://www.gdquest.com/open-source/guidelines/godot-gdscript/#in-short)):

```
1.  Extends and class_name
2.  """docstring"""

3.  Signals
4.  Node dependencies
5.  Constants
6.  Variables (properties)

7.  Built-in virtual callbacks (eg: \_ready, \_input, \_process, ...)
8.  Signal callbacks (eg: on_button_pressed, on_area_entered, on_body_entered, ...)
9.  Methods
```
 
## Reference Kingdom Rush gameplay

- https://www.youtube.com/watch?v=kHcO2NFInuY
- https://www.youtube.com/watch?v=dZ56Y2FYYU0

# License

- **Code**: GPLv3
- **Assets** [CC-BY](https://creativecommons.org/licenses/by/4.0/) 
- Kenney assets are released under CC0 
   - https://www.kenney.nl/assets/topdown-tanks-redux
   - https://www.kenney.nl/assets/tower-defense-top-down
