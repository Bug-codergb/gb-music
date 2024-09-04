import { useEffect } from 'react';

const useBackTop = () => {
  useEffect(() => {
    let html = document.documentElement;
    let body = document.body;
    body.scrollTop = 0;
    html.scrollTop = 0;
  }, []);
};
export default useBackTop;
