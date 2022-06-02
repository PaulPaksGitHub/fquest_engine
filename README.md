# FQuest_Enqine
### FQuest_Enqine is the game engine for visual quests and novels.

## Table of contents
1. [Setup and launch](#setup-and-launch)
2. [Introduction](#introduction)

## Setup and launch 
1. Install flutter on your machine according the official Flutter documentation.
2. Run ```dart ./lib/cmp.dart``` in the project root folder to prepare game assets.
3. Run ```flutter run``` in the same directory to launch the game.

## Introduction 
### First game scene
Open directory `assets/scenario` and then file `start.scn`. 
Here you can see the entry point of your visual novel. Every time you make a change in .scn file, 
you need run ```dart ./lib/cmp.dart``` to apply the changes in the game;

Try to write you first scene. Just add ```me "I'm amazing"``` inside the scene block like this:
```
character me (name: "Me")
scene start {
    me "I'm amazing" <-- Put it here
}
```