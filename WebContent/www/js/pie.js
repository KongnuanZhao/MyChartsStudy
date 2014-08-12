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
            var myChart = ec.init(document.getElementById('main'));
            var idx = 1;
            myChart.setOption({ timeline : {
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
                            text: 'CPI八大类分别对整体CPI的一个影响程度',
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
                            data:['食品类','烟酒及用品类','衣着类','家庭设备用品及维修服务类','医疗保健和个人用品类','交通和通讯类','娱乐教育文化用品及服务类','居住类']
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
                                name:'2013年6月全国CPI',
                                type:'pie',
                                center: ['50%', '45%'],
                                radius: '50%',
                                data:[
                                    {value: 104.9,  name:'食品类'},
                                    {value: 100.3,  name:'烟酒及用品类'},
                                    {value: 102.3,  name:'衣着类'},
                                    {value: 101.5,  name:'家庭设备用品及维修服务类'},
                                    {value: 101.4, name:'医疗保健和个人用品类'},
                                    {value: 99.3,  name:'交通和通讯类'},
                                    {value: 101.4,  name:'娱乐教育文化用品及服务类'},
                                    {value: 103.1, name:'居住类'}
                                ]
                            }
                        ]
                    },
                    {
                    	 series : [
                                   {
                                       name:'2013年7月全国CPI',
                                       type:'pie',
                                       center: ['50%', '45%'],
                                       radius: '50%',
                                       data:[
                                           {value: 105,  name:'食品类'},
                                           {value: 100.2,  name:'烟酒及用品类'},
                                           {value: 102.2,  name:'衣着类'},
                                           {value: 101.4,  name:'家庭设备用品及维修服务类'},
                                           {value: 101.2, name:'医疗保健和个人用品类'},
                                           {value: 99.9,  name:'交通和通讯类'},
                                           {value: 101.3,  name:'娱乐教育文化用品及服务类'},
                                           {value: 102.8, name:'居住类'}
                                       ]
                                   }
                               ]
                    },
                    {
                   	 series : [
                                  {
                                      name:'2013年8月全国CPI',
                                      type:'pie',
                                      center: ['50%', '45%'],
                                      radius: '50%',
                                      data:[
                                          {value: 104.7,  name:'食品类'},
                                          {value: 100,  name:'烟酒及用品类'},
                                          {value: 102.2,  name:'衣着类'},
                                          {value: 101.4,  name:'家庭设备用品及维修服务类'},
                                          {value: 101.2, name:'医疗保健和个人用品类'},
                                          {value: 100,  name:'交通和通讯类'},
                                          {value: 101.2,  name:'娱乐教育文化用品及服务类'},
                                          {value: 102.6, name:'居住类'}
                                      ]
                                  }
                              ]
                   },
                   {
                  	 series : [
                                 {
                                     name:'2013年9月全国CPI',
                                     type:'pie',
                                     center: ['50%', '45%'],
                                     radius: '50%',
                                     data:[
                                         {value: 106.1,  name:'食品类'},
                                         {value: 99.8,  name:'烟酒及用品类'},
                                         {value: 102.3,  name:'衣着类'},
                                         {value: 101.4,  name:'家庭设备用品及维修服务类'},
                                         {value: 101.1, name:'医疗保健和个人用品类'},
                                         {value: 99.8,  name:'交通和通讯类'},
                                         {value: 101.9,  name:'娱乐教育文化用品及服务类'},
                                         {value: 102.6, name:'居住类'}
                                     ]
                                 }
                             ]
                  },
                  { 
                 	 series : [
                                {
                                    name:'2013年10月全国CPI',
                                    type:'pie',
                                    center: ['50%', '45%'],
                                    radius: '50%',
                                    data:[
                                        {value: 106.5,  name:'食品类'},
                                        {value: 99.8,  name:'烟酒及用品类'},
                                        {value: 102.4,  name:'衣着类'},
                                        {value: 101.5,  name:'家庭设备用品及维修服务类'},
                                        {value: 101, name:'医疗保健和个人用品类'},
                                        {value: 99.4,  name:'交通和通讯类'},
                                        {value: 102.5,  name:'娱乐教育文化用品及服务类'},
                                        {value: 102.6, name:'居住类'}
                                    ]
                                }
                            ]
                 },
                 {
                	 series : [
                               {
                                   name:'2013年11月全国CPI',
                                   type:'pie',
                                   center: ['50%', '45%'],
                                   radius: '50%',
                                   data:[
                                       {value: 105.9,  name:'食品类'},
                                       {value: 99.8,  name:'烟酒及用品类'},
                                       {value: 102,  name:'衣着类'},
                                       {value: 101.3,  name:'家庭设备用品及维修服务类'},
                                       {value: 101, name:'医疗保健和个人用品类'},
                                       {value: 99.5,  name:'交通和通讯类'},
                                       {value: 102.8,  name:'娱乐教育文化用品及服务类'},
                                       {value: 102.6, name:'居住类'}
                                   ]
                               }
                           ]
                },
                {
               	 series : [
                              {
                                  name:'2013年12月全国CPI',
                                  type:'pie',
                                  center: ['50%', '45%'],
                                  radius: '50%',
                                  data:[
                                      {value: 104.1,  name:'食品类'},
                                      {value: 99.6,  name:'烟酒及用品类'},
                                      {value: 102.1,  name:'衣着类'},
                                      {value: 101.4,  name:'家庭设备用品及维修服务类'},
                                      {value: 100.9, name:'医疗保健和个人用品类'},
                                      {value: 102.9,  name:'交通和通讯类'},
                                      {value: 102.8,  name:'娱乐教育文化用品及服务类'},
                                      {value: 100, name:'居住类'}
                                  ]
                              }
                          ]
               },
               {
              	 series : [
                             {
                                 name:'2014年1月全国CPI',
                                 type:'pie',
                                 center: ['50%', '45%'],
                                 radius: '50%',
                                 data:[
                                     {value: 103.7,  name:'食品类'},
                                     {value: 99.3,  name:'烟酒及用品类'},
                                     {value: 101.9,  name:'衣着类'},
                                     {value: 101.5,  name:'家庭设备用品及维修服务类'},
                                     {value: 101.1, name:'医疗保健和个人用品类'},
                                     {value: 100.2,  name:'交通和通讯类'},
                                     {value: 103.3,  name:'娱乐教育文化用品及服务类'},
                                     {value: 102.8, name:'居住类'}
                                 ]
                             }
                         ]
              },
              {           	
             	 series : [
                            {
                                name:'2014年2月全国CPI',
                                type:'pie',
                                center: ['50%', '45%'],
                                radius: '50%',
                                data:[
                                    {value: 102.7,  name:'食品类'},
                                    {value: 99.3,  name:'烟酒及用品类'},
                                    {value: 102.2,  name:'衣着类'},
                                    {value: 101.3,  name:'家庭设备用品及维修服务类'},
                                    {value: 101, name:'医疗保健和个人用品类'},
                                    {value: 99.6,  name:'交通和通讯类'},
                                    {value: 102.1,  name:'娱乐教育文化用品及服务类'},
                                    {value: 102.8, name:'居住类'}
                                ]
                            }
                        ]
             },
             {
            	 series : [
                           {
                               name:'2014年3月全国CPI',
                               type:'pie',
                               center: ['50%', '45%'],
                               radius: '50%',
                               data:[
                                   {value: 104.1,  name:'食品类'},
                                   {value: 99.3,  name:'烟酒及用品类'},
                                   {value: 102.3,  name:'衣着类'},
                                   {value: 101.2,  name:'家庭设备用品及维修服务类'},
                                   {value: 101.2, name:'医疗保健和个人用品类'},
                                   {value: 99.6,  name:'交通和通讯类'},
                                   {value: 102.1,  name:'娱乐教育文化用品及服务类'},
                                   {value: 102.5, name:'居住类'}
                               ]
                           }
                       ]
            },
            {
           	 series : [
                          {
                              name:'2014年4月全国CPI',
                              type:'pie',
                              center: ['50%', '45%'],
                              radius: '50%',
                              data:[
                                  {value: 102.3,  name:'食品类'},
                                  {value: 99.4,  name:'烟酒及用品类'},
                                  {value: 102.3,  name:'衣着类'},
                                  {value: 101.2,  name:'家庭设备用品及维修服务类'},
                                  {value: 101.2, name:'医疗保健和个人用品类'},
                                  {value: 100.1,  name:'交通和通讯类'},
                                  {value: 102,  name:'娱乐教育文化用品及服务类'},
                                  {value: 102.4, name:'居住类'}
                              ]
                          }
                      ]
           },
           {    	 
          	 series : [
                         {
                             name:'2014年5月全国CPI',
                             type:'pie',
                             center: ['50%', '45%'],
                             radius: '50%',
                             data:[
                                 {value: 104.1,  name:'食品类'},
                                 {value: 99.4,  name:'烟酒及用品类'},
                                 {value: 102.5,  name:'衣着类'},
                                 {value: 101.2,  name:'家庭设备用品及维修服务类'},
                                 {value: 101.2, name:'医疗保健和个人用品类'},
                                 {value: 100.6,  name:'交通和通讯类'},
                                 {value: 102.1,  name:'娱乐教育文化用品及服务类'},
                                 {value: 102.3, name:'居住类'}
                             ]
                         }
                     ]
          },
          {
           	 series : [
                          {                       	
                              name:'2014年6月全国CPI',
                              type:'pie',
                              center: ['50%', '45%'],
                              radius: '50%',
                              data:[
                                  {value: 103.7,  name:'食品类'},
                                  {value: 99.4,  name:'烟酒及用品类'},
                                  {value: 102.6,  name:'衣着类'},
                                  {value: 101.2,  name:'家庭设备用品及维修服务类'},
                                  {value: 101.3, name:'医疗保健和个人用品类'},
                                  {value: 100.6,  name:'交通和通讯类'},
                                  {value: 102.1,  name:'娱乐教育文化用品及服务类'},
                                  {value: 102.2, name:'居住类'}
                              ]
                          }
                      ]
           }
                ]
            	});
        }
    );