import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import {
  AppstoreOutlined
} from '@ant-design/icons';
import logo from '@/assets/img/logo.png';
import { Flex, Layout, Menu,Button,Image } from 'antd';
import Topbar from './childCpn/topbar';
import { InnovateWrapper, ContentBody } from './style';
import NavList from './childCpn/navList';
import navlist from './childCpn/navList/constant/index';
import { Outlet,useNavigate ,useLocation} from 'react-router-dom';

const { Header, Footer, Sider, Content } = Layout;

const headerStyle: React.CSSProperties = {
  color: '#fff',
  height: 64,
  paddingInline: 48,
  backgroundColor: '#fff',
  borderBottom: '1px solid #e5e7ec'
};

const contentStyle: React.CSSProperties = {
  color: '#fff',
  backgroundColor: '#f1f2f4',
  padding:'16px',
  overflow:"hidden"
};

const siderStyle: React.CSSProperties = {
  color: '#fff',
  backgroundColor: '#fff',
  borderRight: '1px solid #e5e7ec',
  
};

const footerStyle: React.CSSProperties = {
  color: '#fff',
  backgroundColor: '#fff',
  borderTop: '1px solid #e5e7ec'
};

const layoutStyle = {
  borderRadius: 8,
  overflow: 'hidden',
  width: '100%',
  height: '100%'
};

const Innovate: FC = (props): ReactElement => {
  const navigate = useNavigate()
  const location = useLocation();
  const onClick = ({item,key}) => {
    console.log(key)
    navigate(key,{
      replace:true
    })
  };
  const defaultKey:string[]=[];
  const defaultSelectedKeys:string[]=[]
  const items: any[] = navlist.map((item:any,index:number)=>{
    defaultKey.push(item.title);
    return {
      key:item.title,
      label:item.title,
      icon:<AppstoreOutlined />,
      children:item.list.map((it:any,i:number)=>{
        defaultSelectedKeys.push(it.path);
        return {
          key:it.path,
          label:it.name
        }
      })
    }
  });
  items.unshift({
    key:'/innovate/publish',
    label:<Button color="danger" variant="solid" shape="round" size="large" danger style={{width:'100%'}}>发布</Button>
  })
  const [selectedKeys,setSelectedKeys] = useState<string[]>([]);
  useEffect(()=>{
    setSelectedKeys([location.pathname]);
  },[location.pathname])

  const handleClick=()=>{
    navigate("/Home")
  }
  return (
    // <InnovateWrapper>
    //   <Topbar />
    //   <ContentBody>
    //     <NavList />
    //     <div className="content-body">
    //       <Outlet/>
    //     </div>
    //   </ContentBody>
    // </InnovateWrapper>
    <InnovateWrapper>
      <Layout style={layoutStyle}>
        <Header style={headerStyle}>
          <Image src={logo} width={50} preview={false} style={{cursor:'pointer',borderRadius:'4px'}} onClick={()=>handleClick()}/>
        </Header>
        <Layout>
          <Sider width="216px" style={siderStyle}>
            <Menu
              onClick={onClick}
              style={{ width: '100%' }}
              defaultSelectedKeys={defaultSelectedKeys[0]}
              selectedKeys={selectedKeys}
              defaultOpenKeys={defaultKey}
              mode="inline"
              items={items}
            />
          </Sider>
          <Content style={contentStyle}>
            <div className='table-box'>
            <Outlet/>
            </div>
          </Content>
        </Layout>
      
      </Layout>
    </InnovateWrapper>
  );
};
export default memo(Innovate);
