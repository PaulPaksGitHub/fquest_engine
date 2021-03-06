enum EKeyword {
  SCENE,
  CHARACTER,
  SHOW,
  WAIT,
  SPEECH,
  HIDE,
  ANCHOR,
  JUMP,
  IF,
  ELSE,
  TRUE,
  FALSE,
  FUNC,
  RETURN,
  PLAYER,
  PLAY,
  PAUSE,
  SPRITE,
  ANIMATION,
  SURFACE,
  CLEAN,
  ANIMATE
}

const KeywordsMap = {
  EKeyword.RETURN: 'return',
  EKeyword.FUNC: 'func',
  EKeyword.TRUE: 'true',
  EKeyword.FALSE: 'false',
  EKeyword.ELSE: 'else',
  EKeyword.SCENE: 'scene',
  EKeyword.CHARACTER: 'character',
  EKeyword.SHOW: 'show',
  EKeyword.WAIT: 'wait',
  EKeyword.HIDE: 'hide',
  EKeyword.ANCHOR: 'anchor',
  EKeyword.JUMP: 'jump',
  EKeyword.IF: 'if',
  EKeyword.PLAYER: 'player',
  EKeyword.PLAY: 'play',
  EKeyword.PAUSE: 'pause',
  EKeyword.SPRITE: 'sprite',
  EKeyword.ANIMATION: 'animation',
  EKeyword.SURFACE: 'surface',
  EKeyword.CLEAN: 'clean',
  EKeyword.ANIMATE: 'animate',
};