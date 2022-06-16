<template>
  <div class="channel">
    <Header title="电台" />
    <div class="channel-container"></div>
  </div>
</template>

<script>
import Header from '@/views/billboard/childCpn/header/Header';
import * as echarts from 'echarts';
import { getChannelData } from '@/network/channel';
export default {
  name: 'Channel',
  components: { Header },
  data() {
    return {
      option: {},
      channel: [],
      m: new Map(),
      timer: null,
      legendTimer: null
    };
  },
  async mounted() {
    const result = await getChannelData();
    this.channel = result.map((item, index) => {
      this.m.set(item.name, item.count);
      return {
        value: item.count,
        name: item.name
      };
    });
    this.option = {
      color: [
        '#5470c6',
        '#91cc75',
        '#ee6666',
        '#fac858',
        '#1ebbee',
        '#61a0a8',
        '#d48265',
        '#91c7ae',
        '#749f83',
        '#ca8622',
        '#bda29a',
        '#057ed7',
        '#871094',
        '#c4ccd3'
      ],
      legend: {
        type: 'scroll',
        top: '20%',
        left: '45%',
        orient: 'vertical',
        height: '110',
        formatter: (params) => {
          return `${params} (${this.m.get(params)}个)`;
        },
        textStyle: {
          color: []
        },
        pageButtonPosition: 'end',
        pageIconColor: '#2ec2da',
        pageIconSize: 12
      },
      tooltip: {
        trigger: 'item',
        backgroundColor: '#00000099',
        textStyle: {
          color: '#fff',
          fontSize: '14px'
        },
        formatter: (params) => {
          let temp = `${params.name}&nbsp;:&ensp; ${params.value}个`;
          return `<div><span>${params.marker}</span>&ensp;${temp}</div>`;
        },
        confine: true
      },
      series: [
        {
          name: 'channel Chart',
          type: 'pie',
          radius: ['50%', '80%'],
          itemStyle: {
            borderRadius: 2
          },
          top: '5%',
          bottom: '1%',
          left: '0',
          right: '60%',
          label: {
            show: false
          },
          labelLine: {
            show: false
          },
          data: this.channel
        }
      ]
    };
    let channelEcharts = echarts.init(document.querySelector('.channel-container'));
    channelEcharts.setOption(this.option);
    let index = 0;
    this.timer = setInterval(() => {
      channelEcharts.dispatchAction({
        type: 'showTip',
        seriesIndex: 0,
        dataIndex: index
      });
      for (let inner in this.channel) {
        channelEcharts.dispatchAction({
          type: 'downplay',
          seriesIndex: 0,
          dataIndex: inner
        });
      }
      channelEcharts.dispatchAction({
        type: 'highlight',
        seriesIndex: 0,
        dataIndex: index
      });
      index++;
      if (index > this.channel.length) {
        index = 0;
      }
    }, 2000);
  },
  beforeDestroy() {
    clearInterval(this.timer);
  }
};
</script>

<style scoped lang="less">
.channel-container {
  width: 100%;
  height: 178px;
}
</style>
