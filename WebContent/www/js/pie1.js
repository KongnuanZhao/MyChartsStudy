require.config({
        paths:{ 
            echarts:'./js/echarts',
            'echarts/chart/bar' : './js/echarts-map',
            'echarts/chart/line': './js/echarts-map',
            'echarts/chart/map' : './js/echarts-map'
        }
    });
    
    // Step:4 require echarts and use it in the callback.
    // Step:4 动态加载echarts然后在回调函数中开始使用，注意保持按需加载结构定义图表路径
    require(
        [
            'echarts',
            'echarts/chart/bar',
            'echarts/chart/line',
            'echarts/chart/map'
        ],
        function (ec) {
            var myChart1 = ec.init(document.getElementById('main1'));
            var idx = 1;
            myChart1.setOption({ timeline : {
                data : [
                        '2013-06-01', '2013-07-01', '2013-08-01', '2013-09-01', '2013-10-01','2013-11-01','2013-12-01',
                        { name:'2013-12-01', symbol:'emptyStar6', symbolSize:8 },
                        '2014-01-01', '2014-02-01', '2014-03-01', '2014-04-01', '2014-05-01','2014-06-01',
                        { name:'2014-06-01', symbol:'star6', symbolSize:8 }
                    ],
                    label : {
                        formatter : function(s) {
                            return s.slice(0, 7);
                        }
                    }
                },
                options : [
                    {
                        title : {
                            text: '影响食品类居民消费指数主要指标',
                            subtext: '数据来源：国家统计局'
                        },
                        tooltip : {
                            trigger: 'item',
                            formatter: "{a} <br/>{b} : {c} ({d}%)"
                        },
                        legend: {
                        	orient: 'vertical',
                            x:'right',
                            y:'center',
                            data:['粮食类','肉禽及其制品类','蛋类','水产品类','鲜菜类','鲜果类']
                        },
                        toolbox: {
                            show : true,
                            feature : {
                                mark : {show: true},
                                dataView : {show: true, readOnly: false},
                                restore : {show: true},
                                saveAsImage : {show: true}
                            }
                        },
                        series : [
                            {
                                name:'2013年6月食品类CPI',
                                type:'pie',
                                center: ['50%', '45%'],
                                radius: '50%',
                                data:[
                                    
                                    {value: 105.1,  name:'粮食类'},
                                    {value: 104.8,  name:'肉禽及其制品类'},
                                    {value: 100.3,  name:'蛋类'},
                                    {value: 103.1, name:'水产品类'},
                                    {value: 109.7,  name:'鲜菜类'},
                                    {value: 111.4,  name:'鲜果类'}
                                    
                                ]
                            }
                        ]
                    },
                    {
                    	series : [
                                  {
                                      name:'2013年7月食品类CPI',
                                      type:'pie',
                                      center: ['50%', '45%'],
                                      radius: '50%',
                                      data:[
                                          
                                          {value: 105.1,  name:'粮食类'},
                                          {value: 105.9,  name:'肉禽及其制品类'},
                                          {value: 101.3,  name:'蛋类'},
                                          {value: 103.1, name:'水产品类'},
                                          {value: 111.8,  name:'鲜菜类'},
                                          {value: 107.3,  name:'鲜果类'}
                                          
                                      ]
                                  }
                              ]
                    },
                    {
                    	series : [
                                  {
                                      name:'2013年8月食品类CPI',
                                      type:'pie',
                                      center: ['50%', '45%'],
                                      radius: '50%',
                                      data:[
                                          
                                          {value: 104.7,  name:'粮食类'},
                                          {value: 107.2,  name:'肉禽及其制品类'},
                                          {value: 100.3,  name:'蛋类'},
                                          {value: 104.3, name:'水产品类'},
                                          {value: 105.2,  name:'鲜菜类'},
                                          {value: 107.5,  name:'鲜果类'}
                                          
                                      ]
                                  }
                              ]
                    },
                    {
                    	series : [
                                  {
                                      name:'2013年9月食品类CPI',
                                      type:'pie',
                                      center: ['50%', '45%'],
                                      radius: '50%',
                                      data:[
                                          
                                          {value: 104,  name:'粮食类'},
                                          {value: 106.6,  name:'肉禽及其制品类'},
                                          {value: 101.3,  name:'蛋类'},
                                          {value: 105.9, name:'水产品类'},
                                          {value: 118.9,  name:'鲜菜类'},
                                          {value: 112.5,  name:'鲜果类'}
                                          
                                      ]
                                  }
                              ]
                    },
                    {
                    	series : [
                                  {
                                      name:'2013年10月食品类CPI',
                                      type:'pie',
                                      center: ['50%', '45%'],
                                      radius: '50%',
                                      data:[
                                          
                                          {value: 103.8,  name:'粮食类'},
                                          {value: 105.8,  name:'肉禽及其制品类'},
                                          {value: 99.3,  name:'蛋类'},
                                          {value: 106.4, name:'水产品类'},
                                          {value: 131.5,  name:'鲜菜类'},
                                          {value: 108.8,  name:'鲜果类'}
                                          
                                      ]
                                  }
                              ]
                    },
                    {
                    	series : [
                                  {
                                      name:'2013年11月食品类CPI',
                                      type:'pie',
                                      center: ['50%', '45%'],
                                      radius: '50%',
                                      data:[
                                         
                                          {value: 104,  name:'粮食类'},
                                          {value: 105.5,  name:'肉禽及其制品类'},
                                          {value: 98.3,  name:'蛋类'},
                                          {value: 106.5, name:'水产品类'},
                                          {value: 122.3,  name:'鲜菜类'},
                                          {value: 110.6,  name:'鲜果类'}
                                          
                                      ]
                                  }
                              ]
                    },
                    {
                    	series : [
                                  {
                                      name:'2013年12月食品类CPI',
                                      type:'pie',
                                      center: ['50%', '45%'],
                                      radius: '50%',
                                      data:[
                                         
                                          {value: 103.8,  name:'粮食类'},
                                          {value: 103.6,  name:'肉禽及其制品类'},
                                          {value: 95.9,  name:'蛋类'},
                                          {value: 105.5, name:'水产品类'},
                                          {value: 102.6,  name:'鲜菜类'},
                                          {value: 115.6,  name:'鲜果类'}
                                          
                                      ]
                                  }
                              ]
                    },
                    {
                    	series : [
                                  {
                                      name:'2014年1月食品类CPI',
                                      type:'pie',
                                      center: ['50%', '45%'],
                                      radius: '50%',
                                      data:[
                                         
                                          {value: 103.1,  name:'粮食类'},
                                          {value: 100.3,  name:'肉禽及其制品类'},
                                          {value: 96.2,  name:'蛋类'},
                                          {value: 106.3, name:'水产品类'},
                                          {value: 102.1,  name:'鲜菜类'},
                                          {value: 123,  name:'鲜果类'}
                                          
                                      ]
                                  }
                              ]
                    },
                    {
                    	series : [
                                  {
                                      name:'2014年2月食品类CPI',
                                      type:'pie',
                                      center: ['50%', '45%'],
                                      radius: '50%',
                                      data:[
                                         
                                          {value: 102.8,  name:'粮食类'},
                                          {value: 97,  name:'肉禽及其制品类'},
                                          {value: 94.2,  name:'蛋类'},
                                          {value: 104.7, name:'水产品类'},
                                          {value: 103.3,  name:'鲜菜类'},
                                          {value: 119.7,  name:'鲜果类'}
                                          
                                      ]
                                  }
                              ]
                    },
                    {                  
                    	series : [
                                  {
                                      name:'2014年3月食品类CPI',
                                      type:'pie',
                                      center: ['50%', '45%'],
                                      radius: '50%',
                                      data:[
                                         
                                          {value: 102.7,  name:'粮食类'},
                                          {value: 98.2,  name:'肉禽及其制品类'},
                                          {value: 100.4,  name:'蛋类'},
                                          {value: 107.7, name:'水产品类'},
                                          {value: 112.9,  name:'鲜菜类'},
                                          {value: 117.3,  name:'鲜果类'}
                                          
                                      ]
                                  }
                              ]
                    },
                    {                
                    	series : [
                                  {
                                      name:'2014年4月食品类CPI',
                                      type:'pie',
                                      center: ['50%', '45%'],
                                      radius: '50%',
                                      data:[
                                          
                                          {value: 102.8,  name:'粮食类'},
                                          {value: 99.3,  name:'肉禽及其制品类'},
                                          {value: 107,  name:'蛋类'},
                                          {value: 105.7, name:'水产品类'},
                                          {value: 92.1,  name:'鲜菜类'},
                                          {value: 118.6,  name:'鲜果类'}
                                          
                                      ]
                                  }
                              ]
                    },
                    {
                    	series : [
                                  {
                                      name:'2014年5月食品类CPI',
                                      type:'pie',
                                      center: ['50%', '45%'],
                                      radius: '50%',
                                      data:[
                                          
                                          {value: 103,  name:'粮食类'},
                                          {value: 103.2,  name:'肉禽及其制品类'},
                                          {value: 117.6,  name:'蛋类'},
                                          {value: 105, name:'水产品类'},
                                          {value: 97.5,  name:'鲜菜类'},
                                          {value: 120,  name:'鲜果类'}
                                          
                                      ]
                                  }
                              ]
                    },
                    {
                    	series : [
                                  {
                                      name:'2014年6月食品类CPI',
                                      type:'pie',
                                      center: ['50%', '45%'],
                                      radius: '50%',
                                      data:[
                                          
                                            {value: 103.2,  name:'粮食类'},
                                            {value: 101.9,  name:'肉禽及其制品类'},
                                            {value: 113.1,  name:'蛋类'},
                                            {value: 104, name:'水产品类'},
                                            {value: 98.2,  name:'鲜菜类'},
                                            {value: 119.8,  name:'鲜果类'}
                                            
                                        ]
                                  }
                              ]
                    }
                ]
            	});
        }
    );