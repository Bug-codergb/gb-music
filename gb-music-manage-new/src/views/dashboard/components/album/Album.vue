<template>
  <div class="album">
    <Header title="专辑" />
    <div class="album-container"></div>
  </div>
</template>

<script>
import * as echarts from 'echarts';
import { getAlbumDataApi } from '@/api/modules/album';
import Header from '../header/Header';
export default {
  name: 'Album',
  components: { Header },
  data() {
    return {
      option: {},
      album: [],
      m: new Map(),
      timer: null,
      albumEcharts:null
    };
  },
  async mounted() {
    if (echarts) {
      const res = await getAlbumDataApi();
      this.album = res.album.map((item, index) => {
        this.m.set(item.name, item.count);
        return {
          value: item.count / res.total,
          name: item.name
        };
      });
      let self = this;
      this.option = {
        legend: {
          top: '25%',
          left: '45%',
          orient: 'vertical',
          height: '100',
          formatter: (params) => {
            return `${params} (${self.m.get(params)}张)`;
          },
          textStyle: {
            color: []
          }
        },
        tooltip: {
          trigger: 'item',
          backgroundColor: '#00000099',
          textStyle: {
            color: '#fff',
            fontSize: '14px'
          },
          formatter: (params) => {
            let temp = `${params.name}&nbsp;:&ensp; ${params.value * res.total}张`;
            return `<div><span>${params.marker}</span>:&ensp;${temp}</div>`;
          },
          confine: true
        },
        series: [
          {
            name: 'Nightingale Chart',
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
            data: this.album
          }
        ]
      };
      let albumEcharts = echarts.init(document.querySelector('.album-container'));
      albumEcharts.setOption(this.option);
      this.albumEcharts = albumEcharts
      window.addEventListener("resize",this.handleResize);
    }
  },
  beforeUnmount() {
    window.removeEventListener("resize",this.handleResize);
  },
  methods: {
    handleResize(){
      this.albumEcharts && this.albumEcharts.resize();
    }
  }
};
</script>

<style scoped lang="scss">
.album{
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
}
.album-container {
  width: 100%;
  flex:1;
}
</style>
