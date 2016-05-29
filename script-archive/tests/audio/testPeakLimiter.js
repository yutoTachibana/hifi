var audioOptions = {
  volume: 1.0,
  loop: true,
  position: MyAvatar.position
}

var sineWave = Script.resolvePath("./1760sine.wav");
var sound = SoundCache.getSound(sineWave);
var injectorCount = 0;
var MAX_INJECTOR_COUNT = 40;

Script.update.connect(function() {
    if (sound.downloaded && injectorCount < MAX_INJECTOR_COUNT) {
        injectorCount++;
        print("stating injector:" + injectorCount);
        Audio.playSound(sound, audioOptions);
    }
}); 