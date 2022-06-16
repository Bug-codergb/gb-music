export function debounce(fn, time, immediate) {
  let t = null;
  let debounced = function () {
    let self = this;
    let args = arguments;

    if (t) {
      clearTimeout(t);
    }

    if (immediate) {
      let exec = !t;
      t = setTimeout(() => {
        t = null;
      }, time);

      if (exec) fn.apply(self, args);
    } else {
      t = setTimeout(() => {
        fn.apply(self, args);
      }, time);
    }
  };
  debounced.remove = function () {
    clearTimeout(t);
    t = null;
  };
  return debounced;
}
