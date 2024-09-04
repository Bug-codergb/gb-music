export const getFormatLyric = (lyric: string) => {
  const lyricArray = [];
  const lyricExp = /\[(\d{2}):(\d{2})\.(\d{2,3})\]/;
  const lineLyric = lyric.split('\n');

  for (let item of lineLyric) {
    if (item) {
      const result = lyricExp.exec(item);
      if (!result) continue;
      // @ts-ignore
      const time1: any = result[1] * 60 * 1000;
      // @ts-ignore
      const time2: any = result[2] * 1000;
      // @ts-ignore
      const time3: any = result[3].length === 3 ? result[3] * 1 : result[3] * 10;
      const duration = time1 + time2 + time3;
      const content = item.replace(lyricExp, '').trim();
      const lyricObj = { duration, content };
      lyricArray.push(lyricObj);
    }
  }
  return lyricArray;
};
