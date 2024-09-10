export function getVideoDuration(file) {
  let url = URL.createObjectURL(file);
  let oVideo = document.createElement('video');
  oVideo.setAttribute('src', url);
  return new Promise((resolve, reject) => {
    oVideo.oncanplay = () => {
      resolve(oVideo.duration * 1000);
    };
  });
}
