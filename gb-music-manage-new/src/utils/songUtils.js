export function getAudioDuration(file) {
  let url = URL.createObjectURL(file);
  let oAudio = document.createElement('audio');
  oAudio.setAttribute('src', url);
  return new Promise((resolve, reject) => {
    oAudio.oncanplay = () => {
      resolve(oAudio.duration * 1000);
    };
  });
}
