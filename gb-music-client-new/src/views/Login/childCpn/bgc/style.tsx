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
  height: 100%;
  width: 100%;
  .page {
    display: flex;
    width: 100%;
    background-color: #fff;
    height: 100%;
    flex-direction: column;
    align-items: center;
  }
  // Start here
  .cta-container-images {
    width: 100%;
    height: 100%;
    background: #f3f4f5;
    padding:5% 0 0 0;
    overflow: hidden;
    .cta-singular-cell {
    position: relative;
    float: left;
    height: $ctaHeight;
    @media (max-width: 1920px) {
      height: 200px;
    }
    .cta-even-image,
    .cta-odd-image {
      width: 100%;
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      height: $ctaHeight;
      position: absolute;
      top: 0;
      left: 0;
      -webkit-filter: grayscale(1%);
      filter: grayscale(1%);
      @media (max-width: 576px) {
        height: 200px;
      }
    }
    .cta-even-image {
      z-index: 10;
    }
    .cta-odd-image {
      z-index: 11;
    }
    &:nth-child(10) {
      width: 15%;
    }
    &:nth-child(1),
    &:nth-child(2),
    &:nth-child(5),
    &:nth-child(9) {
      width: 20%;
    }
    &:nth-child(6),
    &:nth-child(7),
    &:nth-child(11) {
      width: 25%;
    }
    &:nth-child(3),
    &:nth-child(4),
    &:nth-child(8) {
      width: 30%;
    }
    &:nth-child(12) {
      width: 40%;
    }
  }
}

// Images
.image-1 {
  background-image: url(${mv6});
}
.image-2 {
  background-image: url(${mv5});
}
.image-3 {
  background-image: url(${mv4});
}
.image-4 {
  background-image: url(${mv3});
}
.image-5 {
  background-image: url(${mv2});
}
.image-6 {
  background-image: url(${mv1});
}
.image-7 {
  background-image: url(${artist7});
}
.image-8 {
  background-image: url(${artist2});
}
.image-9 {
  background-image: url(${artist3});
}
.image-10 {
  background-image: url(${artist4});
}
.image-11 {
  background-image: url(${artist5});
}
.image-12 {
  background-image: url(${artist6});
}
.image-13 {
  background-image: url(${album1});
}
.image-14 {
  background-image: url(${album2});
}
.image-15 {
  background-image: url(${album3});
}
.image-16 {
  background-image: url(${album4});
}
.image-17 {
  background-image: url(${album5});
}
.image-18 {
  background-image: url(${album6});
}

// Animation images
.cta-singular-cell {
  perspective: 1000px;
  padding-bottom: 8px;
  padding-right: 5px;
  .cta-internal-image-cont {
    height: 100%;
    transition: all 3s linear;
    transform-style: preserve-3d;

    // Animation
    animation-name: photoFlip;
    animation-fill-mode: both;
    animation-iteration-count: infinite;
    animation-duration: 10s;
    &.flip-1 {
      animation-delay: 1s;
    }
    &.flip-2 {
      animation-delay: 2s;
    }
    &.flip-3 {
      animation-delay: 4s;
    }
    &.flip-4 {
      animation-delay: 6s;
    }
    &.flip-5 {
      animation-delay: 8s;
    }
    &.flip-6 {
      animation-delay: 5s;
    }
    .cta-even-image,
    .cta-odd-image {
      position: absolute;
      top: 0;
      left: 0;
      height: 100%;
    }
    .cta-even-image {
      z-index: 2;
      transform: rotateY(0deg);
    }
    .cta-odd-image {
      z-index: 1;
      transform: rotateY(180deg);
    }
  }
}

@keyframes photoFlip {
  0% {
    transform: rotateY(0deg);
  }
  20% {
    transform: rotateY(180deg);
  }
  80% {
    transform: rotateY(180deg);
  }
  100% {
    transform: rotateY(0deg);
  }
}
`;
