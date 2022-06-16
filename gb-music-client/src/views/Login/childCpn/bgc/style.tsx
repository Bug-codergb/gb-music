import styled from 'styled-components';
import artist2 from '../../../../assets/img/bgc/artist/1117895448.jpg';
import artist3 from '../../../../assets/img/bgc/artist/1261280598.jpg';
import artist4 from '../../../../assets/img/bgc/artist/2553063246.jpg';
import artist5 from '../../../../assets/img/bgc/artist/3302945515.jpg';
import artist6 from '../../../../assets/img/bgc/artist/avatar.jpg';
import artist7 from '../../../../assets/img/bgc/artist/3135346545.jpg';
import mv1 from '../../../../assets/img/bgc/mv/T015R640x360M101000MU5BC02iiWw.webp';
import mv2 from '../../../../assets/img/bgc/mv/T015R640x360M101003zgtVt48ROWa.webp';
import mv3 from '../../../../assets/img/bgc/mv/T015R640x360M101004aB2b71rFi5O.webp';
import mv4 from '../../../../assets/img/bgc/mv/T015R640x360M101004NPl3C47r7qH.webp';
import mv5 from '../../../../assets/img/bgc/mv/T015R640x360M102004XFRCc0c9dH0.webp';
import mv6 from '../../../../assets/img/bgc/mv/T015R640x360M1010015edSB4J4F1q.webp';

import album1 from '../../../../assets/img/bgc/album/T015R640x360M101003hez2l3CGi65.webp';
import album2 from '../../../../assets/img/bgc/album/T015R640x360M101001a4bxJ2QfCn1.webp';
import album3 from '../../../../assets/img/bgc/album/T015R640x360M101003vF9ul4FBlH2.webp';
import album4 from '../../../../assets/img/bgc/album/T015R640x360M101004O1XDf30gA5A.webp';
import album5 from '../../../../assets/img/bgc/album/T015R640x360M1010002wThg1CtjIz.webp';
import album6 from '../../../../assets/img/bgc/album/T015R640x360M1010003x77W1X0FA3.webp';
export const BgcWrapper = styled.div`
  .page {
    display: flex;
    max-width: 1900px;
    background-color: #fff;
    height: 100vh;
  }
  // Start here
  .container {
    width: 100%;
    height: 100vh;
    background: #f3f4f5;

    overflow: hidden;
  }
  .photo-container {
    position: relative;
    top: -90px; // Adjust
    left: -120px; // Adjust
    transform: rotate(10deg);
  }
  .photo-cont-item {
    display: flex;
    width: calc(380px * 6); // 320px + 60px margin
    .photo-item {
      width: 320px;
      height: 200px;
      margin-right: 60px;
      margin-bottom: 60px;
      border-radius: 16px;
      background-size: cover;
      background-repeat: no-repeat;
      background-position: center;
      box-shadow: 0px 2px 40px rgba(0, 0, 0, 0.15);
    }
  }

  // Every row
  .animation-1 {
    animation: scroller 40s linear infinite;
    display: flex;
    width: calc(380px * 12);
  }
  .animation-2 {
    margin-left: 150px;
    animation: scroller 30s linear infinite;
    display: flex;
    width: calc(380px * 12);
  }
  .animation-3 {
    animation: scroller 50s linear infinite;
    display: flex;
    width: calc(380px * 12);
  }

  // Animations
  @keyframes scroller {
    0% {
      transform: translateX(0);
    }
    100% {
      transform: translateX(calc(-380px * 6)); // 320px + 60px margin
    }
  }

  // All selected images
  .photo-1 {
    background-image: url(${artist2});
  }
  .photo-2 {
    background-image: url(${artist3});
  }
  .photo-3 {
    background-image: url(${artist4});
  }
  .photo-4 {
    background-image: url(${artist5});
  }
  .photo-5 {
    background-image: url(${artist6});
  }
  .photo-6 {
    background-image: url(${artist7});
  }
  .photo-7 {
    background-image: url(${mv1});
  }
  .photo-8 {
    background-image: url(${mv2});
  }
  .photo-9 {
    background-image: url(${mv3});
  }
  .photo-10 {
    background-image: url(${mv4});
  }
  .photo-11 {
    background-image: url(${mv5});
  }
  .photo-12 {
    background-image: url(${mv6});
  }
  .photo-13 {
    background-image: url(${album1});
  }
  .photo-14 {
    background-image: url(${album2});
  }
  .photo-15 {
    background-image: url(${album3});
  }
  .photo-16 {
    background-image: url(${album4});
  }
  .photo-17 {
    background-image: url(${album5});
  }
  .photo-18 {
    background-image: url(${album6});
  }
`;
