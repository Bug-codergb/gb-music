export function changeShow(message: string, dt: number) {
  return {
    type: 'changeShow',
    showMsg: {
      message,
      dt
    }
  };
}
