enum EKeyword {
  SCENE,
  BG,
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
  PAUSE
}

const KeywordsMap = {
  EKeyword.RETURN: 'return',
  EKeyword.FUNC: 'func',
  EKeyword.TRUE: 'true',
  EKeyword.FALSE: 'false',
  EKeyword.ELSE: 'else',
  EKeyword.SCENE: 'scene',
  EKeyword.BG: 'bg',
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
};