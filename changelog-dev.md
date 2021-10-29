# UMP1.6開発版の変更履歴

English version below!

## 1.6 β2の変更点
- 修正
  - β1で動画出力すると最初の数秒が飛んでいたのを直しました。
  - β1で透明背景の動画出力がうまくできなかったのを直しました。
  - β1で何も再生せずに[再生終了&アンロード]すると例外が出ていたのを直しました。
  - 起動したときのオーバーレイが、オーバーレイを不透明にする設定に関わらず半透明だったのを直しました。
- 新機能
  - 動画出力に音を含められるようにしました。「自分でMIDIを見たいだけなんだ、投稿しない動画の編集なんかしたくねぇ！」という日もあると思うので。
  - 描画無しで再生ダイアログがやっとまともな見た目になりました。
  - 診断でファイルの後ろに余分なデータがあると警告が出るようにしました。
  - 動画出力でエンコード引数をすべて上書きできるようにしました。
  - MIDIの長さを情報オーバーレイに表示するConfigを追加しました。
- 調整
  - Config`updateChecker.checkOnStartup`をデフォルトで`true`にしました。
  - ショートカットを追加しました:
    - 再生終了&アンロード (Ctrl+W)
  - 動画出力の大きなプレビューをEscキーで閉じれるようにしました。
  - ヘルプメニューのGitHubから"マダ"を消しました。利用規約見たら無料アカウントは1人1つまでなんですね…リア垢持ってる私詰みました。
  - [一時停止]と[1秒飛ばす]のキー入力の受け取り方を変えました。メニューのキー表示が消える代わりに長押ししても重くならなくなります。
  - そういえばあけおめ 2020年最初のベータだよ

## 1.6 β1の変更点
- 一時停止を追加しました。
- 黒MIDI診断が少し速くなったかもしれません。
- MIDI診断の残り時間の計算を変えました。
- MIDI診断に区切り線を追加しました。
- トラック色イベント(MIDI非標準)の読み方を、新しいフォーマットに合わせARGBからRGBAにしました。
- 描画間隔ダイアログに他のプレイヤーでだいたい同じ速度になる設定を追加しました。
- スクリーンショットを追加しました。
- Configの変換コードを書き直しました。
- ffmpegとリソパフォルダをConfigに追加しました。
- MIDIの読み込み中にメモリ使用量を表示できる設定を追加しました。
- config.ymlに合わせ、エラーレポートのConfigがアルファベット順にならないようにしました。
- [開く]のファイルのタイプを翻訳できるようにしました。
- [開く]のファイルのタイプに[すべての対応ファイル]を追加しました。
- 診断にグラフを追加しました。
- 言語リストの順番を変えました。
- 翻訳のフォーマットに`%s`だけが使えるようにしました。
- Discordダイアログを追加しました。
- フルスクリーン中はクイックリサイズが動かないので、メニュー自体を無効化するようにしました。
- ランチャーを書き直しました。
- MIDIのマルチスレッド読み込みのプログレスバーが動かなかったのを修正しました。
- フォルダをドロップで最初のファイルを読み込むようにしました。
- レンダラーがGPUを使うようにしました。
- 情報オーバーレイを隠して再起動するとデフォルトに戻っていたのを修正しました。

--------------------------------------------------------------------------------

# UMP 1.6 Dev Changelog

## 1.6 β2 Changes
- Fixes
  - Fixed a bug in β1 where first few seconds of video render was skipped.
  - Fixed transparent video render in β1 was not working so well.
  - Fixed a bug in β1 where unloading a MIDI before playing any was throwing exception.
  - Fixed a bug where initial overlay was always transparent regardless of opaque overlay config.
- Features
  - You can now include audio to video. If you want to stockpile nolag videos just for yourself, this might help.
  - Play without render dialog has finally got decent look.
  - Added diagnosis warning about extra data in file.
  - Added encoder arguments override to video render.
  - Added config that makes some info overlays show MIDI duration.
- Tweaks
  - Config `updateChecker.checkOnStartup` is now `true` by default.
  - Added keyboard shortcut:
    - Stop and Unload (Ctrl+W)
  - Big preview in video render can now be closed with escape key.
  - Removed :yet: from GitHub in Help menu. I already have IRL account and apparently I'm not allowed to make second free acount.
  - Keyboard input for [Pause] and [Skip by 1 second] are now received in a different way. Shortcut key is no longer displayed in menu, but holding key won't lag the UI anymore.
  - Oh happy new year btw this is the first beta in 2020

## 1.6 β1 Changes
- Added pause.
- Black MIDI might be faster now.
- Changed time remaining calculation in MIDI Diagnosis.
- Added separator line to MIDI Diagnosis.
- Changed track color events (non-MIDI-standard) loading. Color is now loaded as RGBA instead of ARGB.
- Made render interval dialog show setting for same speed on other players.
- Added screenshot.
- Rewrote config conversion.
- Added ffmpeg and resourcepack folder to config.
- Added setting to display memory usage while loading MIDI.
- Made config in error report no longer sorted in alphabetical order.
- Made file type in Open dialog translatable.
- Added [All Supported Files] to Open dialog.
- Added graph to MIDI Diagnosis.
- Updated order in language list.
- Translations can now only have `%s`.
- Added Discord dialog.
- Made quick resize menu disable itself when entering fullscreen, because quick resize doesn't work in fullscreen.
- Rewrote launcher.
- Fixed a visual issue where progress bar in multithreaded MIDI loading wasn't moving.
- Dropping folder now loads first MIDI file in folder.
- Renderers now uses GPU.
- Fixed a bug where [Hide] info overlay was resetting to [Default] when restarted.
