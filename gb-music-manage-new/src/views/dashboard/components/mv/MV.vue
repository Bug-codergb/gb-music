<template>
  <div class="mv">
    <Header title="MV" />
    <div class="mv-container"></div>
  </div>
</template>

<script>
import Header from '../header/Header';
import { getMVDataApi } from '@/api/modules/video';
import * as echarts from 'echarts';
export default {
  name: 'MV',
  components: {
    Header
  },
  data() {
    return {
      option: {},
      mvCate: [],
      mvEcharts:null,
      mvCateData: []
    };
  },
  async mounted() {
    const result = await getMVDataApi();
    this.mvCate = result.map((item, index) => {
      return item.name;
    });
    this.mvCateData = result.map((item, index) => {
      return item.count;
    });
    this.mvPlayCount = result.map((item, index) => {
      return item.playCount;
    });
    this.option = {
      tooltip: {
        trigger: 'axis',
        backgroundColor: '#00000099',
        textStyle: {
          color: '#fff',
          fontSize: '13px'
        },
        axisPointer: {
          type: 'line',
          lineStyle: {
            type: 'solid',
            color: '#fff'
          }
        },
        confine: true
      },
      legend: {},
      grid: {
        top: '32%',
        bottom: '6%',
        left: '5%',
        right: '5%',
        containLabel: true
      },
      xAxis: [
        {
          type: 'category',
          data: this.mvCate
        }
      ],
      yAxis: [
        {
          type: 'value',
          name: 'mv',
          axisLine: {
            show: true,
            symbol: ['none', 'arrow'],
            symbolSize: [5, 6],
            symbolOffset: [2, 4]
          },
          axisTick: {
            show: true,
            inside: true
          }
        },
        {
          type: 'value',
          name: '播放量',
          axisLine: {
            show: true,
            symbol: ['none', 'arrow'],
            symbolSize: [5, 6]
          }
        }
      ],
      series: [
        {
          name: 'MV',
          type: 'bar',
          barWidth: '38%',
          data: this.mvCateData
        },
        {
          name: '播放量',
          type: 'line',
          yAxisIndex: 1,
          data: this.mvPlayCount,
          lineStyle: {
            color: '#ee6666'
          },
          itemStyle: {
            color: '#ee6666'
          }
        }
      ]
    };
    let mvEcharts = echarts.init(document.querySelector('.mv-container'));
    mvEcharts.setOption(this.option);
    this.mvEcharts=mvEcharts;
    window.addEventListener("resize",this.handleResize)
  },
  beforeUnmount() {
    window.removeEventListener("resize",this.handleResize)
  },
  methods:{
    handleResize(){
      this.mvEcharts && this.mvEcharts.resize();
    }
  }
};
</script>

<style scoped lang="scss">
.mv{
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
}
.mv-container {
  width: 100%;
  flex:1;
}
</style>
