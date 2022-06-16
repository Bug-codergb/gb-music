import React, { FormEvent, memo, MouseEvent, useEffect, useState, useRef } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { CSSTransition } from 'react-transition-group';
//样式
import { TopBarWrapper, CenterContent } from './style';
import logo from '../../../assets/img/logo.png';
import NavBar from './childCpn/navBar';
import UserMsg from './childCpn/userMsg';
import SearchMatch from './childCpn/searchMatch';
import Message from './childCpn/message';
import { getAllMsg } from '../../../network/message';

const TopBar: React.FC<RouteComponentProps> = (props) => {
  const [isShow, setIsShow] = useState<boolean>(false);
  const [keyword, setKeyword] = useState<string>('');
  const [count, setCount] = useState<number>(10);
  const [isShowMsg, setIsShowMsg] = useState<boolean>(false);
  useEffect(() => {
    getAllMsg().then((data: any) => {
      if (data) {
        setCount(data.count);
      }
    });
  }, []);
  const topRef = useRef<HTMLDivElement>(null);
  const homeRouter = () => {
    props.history.push({
      pathname: '/Home/discover/recommend'
    });
  };
  const searchFocus = (): void => {
    setIsShow(true);
  };
  const searchClick = (e: MouseEvent<HTMLInputElement>): void => {
    e.stopPropagation();
  };
  const searchInp = (e: FormEvent<HTMLInputElement>): void => {
    setKeyword(e.currentTarget.value);
  };
  useEffect(() => {
    document.addEventListener('click', changeShowFn);
  }, []);
  const changeShowFn = () => {
    setIsShow(false);
    setIsShowMsg(false);
  };
  useEffect(() => {
    return () => {
      document.removeEventListener('click', changeShowFn);
    };
  }, []);
  const searchRouter = (): void => {
    if (keyword.trim().length !== 0) {
      props.history.push({
        pathname: '/Home/searchDetail'
      });
    }
  };
  const innovateClick = () => {
    props.history.push({
      pathname: '/Home/innovation'
    });
  };
  const showMsg = (e: MouseEvent<HTMLElement>) => {
    e.stopPropagation();
    setIsShowMsg(!isShowMsg);
  };
  useEffect(() => {
    window.addEventListener('scroll', pageScroll);
  }, []);
  const pageScroll = () => {
    if (window.pageYOffset > 900) {
      if (topRef && topRef.current) {
        topRef.current.style.position = 'fixed';
      }
    } else {
      if (topRef && topRef.current) {
        topRef.current.style.position = 'static';
      }
    }
  };
  return (
    <TopBarWrapper ref={topRef}>
      <CenterContent>
        <div className="left-content">
          <div className="logo" onClick={(e: MouseEvent<HTMLDivElement>) => homeRouter()}>
            <img src={logo} alt="logo" />
          </div>
          <div className="nav-bar">
            <NavBar />
          </div>
        </div>
        <div className="right-content">
          {/*搜索*/}
          <div className="search-outer">
            <input
              type="text"
              placeholder="搜索"
              onFocus={(e) => searchFocus()}
              onClick={(e) => searchClick(e)}
              onInput={(e) => searchInp(e)}
            />
            <button onClick={(e) => searchRouter()}>
              <i className="iconfont icon-search"> </i>
            </button>
            <CSSTransition in={isShow} timeout={1000} classNames="search" unmountOnExit={true}>
              <SearchMatch keyword={keyword} />
            </CSSTransition>
          </div>
          {/*创作者中心*/}
          <div className="innovation" onClick={(e) => innovateClick()}>
            创作者中心
          </div>
          {/*用户中心*/}
          <div className="user">
            <UserMsg />
          </div>
          {/*消息通知*/}
          <div className="msg">
            <i className="iconfont icon-xiaoxi" onClick={(e) => showMsg(e)}>
              {' '}
            </i>
            {count > 0 && <div className="count">{count}</div>}
            <CSSTransition in={isShowMsg} timeout={1000} classNames="msg" unmountOnExit={true}>
              <Message />
            </CSSTransition>
          </div>
        </div>
      </CenterContent>
    </TopBarWrapper>
  );
};
export default withRouter(memo(TopBar));
