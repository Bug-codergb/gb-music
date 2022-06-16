export function getVideoBase64(url: string) {
  return new Promise((resolve, reject) => {
    const canvas: HTMLCanvasElement = document.createElement('canvas');
    const ctx: CanvasRenderingContext2D = canvas.getContext('2d')!;
    const video: HTMLVideoElement = document.createElement('video');
    video.setAttribute('controls', 'controls');
    video.src = url;
    video.currentTime = 1;
    video.oncanplay = function () {
      //console.log(video.videoHeight,video.videoWidth)
      canvas.height = video.videoHeight;
      canvas.width = video.videoWidth;
      ctx.drawImage(video, 0, 0, video.videoWidth, video.videoHeight);
      let dataUrl: string = canvas.toDataURL('image/png');
      resolve(dataUrl);
    };
  });
}

export function getVideoDuration(file: File) {
  let url: string = URL.createObjectURL(file);
  let oVideo: HTMLVideoElement = document.createElement('video');
  oVideo.setAttribute('src', url);
  return new Promise((resolve, reject) => {
    oVideo.oncanplay = () => {
      resolve(oVideo.duration * 1000);
    };
  });
}
export function getAudioDuration(file: File) {
  let url: string = URL.createObjectURL(file);
  let audio: HTMLAudioElement = document.createElement('audio');
  audio.setAttribute('src', url);
  return new Promise((resolve, reject) => {
    audio.oncanplay = () => {
      resolve(audio.duration * 1000);
    };
  });
}
