import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_wms/common/page_common.dart';
import 'package:flutter_wms/models/bus_station_detal_entity.dart';
import 'package:flutter_wms/pages/buspage/bus_head.dart';
import 'package:flutter_wms/provider/bus_provider.dart';
import 'package:flutter_wms/utils/tire_export.dart';

import 'bus_map_bottom.dart';

class BusSearchPage extends StatefulWidget {
  const BusSearchPage({
    Key key,
  }) : super(key: key);

  @override
  BusSearchPageState createState() => new BusSearchPageState();
}

class BusSearchPageState extends State<BusSearchPage> {
  //复制到老项目中后可自动转换为字符串
  var busdata = "{\n" +
      "  \"error_code\": 0,\n" +
      "  \"reason\": \"Success\",\n" +
      "  \"result\": {\n" +
      "    \"buslines\": [\n" +
      "      {\n" +
      "        \"id\": \"320500012746\",\n" +
      "        \"name\": \"松陵110路(喜庆苑--山湖东路口)\",\n" +
      "        \"type\": \"普通公交\",\n" +
      "        \"polyline\": \"120.630445,31.119342;120.631847,31.119362;120.635081,31.11943;120.635129,31.120956;120.635173,31.12235;120.635237,31.123992;120.635311, 31.125351;120.643647,31.125883;120.648947,31.126167;120.65164,31.1263;120.653158,31.126376;120.654354,31.126562;120.658258,31.127242;120.661196, 31.127802;120.663887,31.12831;120.66675,31.128817;120.667637,31.129075;120.668632,31.129479;120.669508,31.129765;120.670514,31.13016;120.669703, 31.131548;120.668892,31.132789;120.666691,31.135756;120.664276,31.139012;120.663865,31.138777;120.663433,31.138562;120.662613,31.13824;120.660714, 31.137743;120.65685,31.13675;120.6543,31.136114;120.651816,31.135478;120.651301,31.135348;120.650334,31.13812;120.649152,31.141221;120.648079, 31.143948;120.64757,31.145162;120.647497,31.145442;120.647508,31.145649;120.647726,31.146173;120.649003,31.148546;120.649175,31.148866;120.649237, 31.149006;120.649325,31.149203;120.64941,31.15032;120.649448,31.151239;120.649535,31.153319;120.649567,31.154884;120.648998,31.155163;120.647754, 31.155821;120.646638,31.156368;120.646574,31.156557;120.646531,31.156765;120.647046,31.158083;120.647368,31.158744;120.647538,31.158707;120.648783, 31.158157;120.651816,31.156812;120.652086,31.156825;120.652743,31.15703;120.654251,31.157778;120.655996,31.158654;120.659346,31.160398;120.659759, 31.160607;120.660248,31.160788;120.660757,31.160933;120.661331,31.161078;120.661588,31.161066;120.662489,31.161257;120.663079,31.161337;120.663669, 31.161392;120.663745,31.161399;120.667634,31.161418;120.678043,31.161515;120.680074,31.161533;120.688185,31.161606;120.68909,31.161595;120.689331, 31.15692;120.689461,31.152195\",\n" +
      "        \"citycode\": \"0512\",\n" +
      "        \"start_stop\": \"喜庆苑\",\n" +
      "        \"end_stop\": \"山湖东路口\",\n" +
      "        \"start_time\": \"0620\",\n" +
      "        \"end_time\": \"1810\",\n" +
      "        \"company\": \"苏州吴江公共交通有限公司\",\n" +
      "        \"distance\": \"14.96524\",\n" +
      "        \"basic_price\": 1.0,\n" +
      "        \"bounds\": \"120.630445,31.119342;120.689461,31.161606\",\n" +
      "        \"busstops\": [\n" +
      "          {\n" +
      "            \"sequence\": \"1\",\n" +
      "            \"id\": \"BV20028197\",\n" +
      "            \"name\": \"喜庆苑\",\n" +
      "            \"location\": \"120.630445,31.119342\"\n" +
      "          },\n" +
      "          {\n" +
      "            \"sequence\": \"2\",\n" +
      "            \"id\": \"BV20028538\",\n" +
      "            \"name\": \"联杨小区东\",\n" +
      "            \"location\": \"120.635129,31.120956\"\n" +
      "          },\n" +
      "          {\n" +
      "            \"sequence\": \"3\",\n" +
      "            \"id\": \"BV20028433\",\n" +
      "            \"name\": \"联杨新村\",\n" +
      "            \"location\": \"120.635237,31.123992\"\n" +
      "          },\n" +
      "          {\n" +
      "            \"sequence\": \"4\",\n" +
      "            \"id\": \"BV20028302\",\n" +
      "            \"name\": \"长安花苑小学\",\n" +
      "            \"location\": \"120.654354,31.126562\"\n" +
      "          },\n" +
      "          {\n" +
      "            \"sequence\": \"5\",\n" +
      "            \"id\": \"BV20028271\",\n" +
      "            \"name\": \"长安站\",\n" +
      "            \"location\": \"120.658258,31.127242\"\n" +
      "          },\n" +
      "          {\n" +
      "            \"sequence\": \"24\",\n" +
      "            \"id\": \"BV20028418\",\n" +
      "            \"name\": \"新城花园(吴江)\",\n" +
      "            \"location\": \"120.689331,31.15692\"\n" +
      "          },\n" +
      "          {\n" +
      "            \"sequence\": \"25\",\n" +
      "            \"id\": \"BV20028152\",\n" +
      "            \"name\": \"山湖东路口\",\n" +
      "            \"location\": \"120.689461,31.152195\"\n" +
      "          },\n" +
      "          {\n" +
      "            \"sequence\": \"1\",\n" +
      "            \"id\": \"BV20028197\",\n" +
      "            \"name\": \"喜庆苑\",\n" +
      "            \"location\": \"120.630445,31.119342\"\n" +
      "          },\n" +
      "          {\n" +
      "            \"sequence\": \"2\",\n" +
      "            \"id\": \"BV20028538\",\n" +
      "            \"name\": \"联杨小区东\",\n" +
      "            \"location\": \"120.635129,31.120956\"\n" +
      "          },\n" +
      "          {\n" +
      "            \"sequence\": \"3\",\n" +
      "            \"id\": \"BV20028433\",\n" +
      "            \"name\": \"联杨新村\",\n" +
      "            \"location\": \"120.635237,31.123992\"\n" +
      "          },\n" +
      "          {\n" +
      "            \"sequence\": \"4\",\n" +
      "            \"id\": \"BV20028302\",\n" +
      "            \"name\": \"长安花苑小学\",\n" +
      "            \"location\": \"120.654354,31.126562\"\n" +
      "          },\n" +
      "          {\n" +
      "            \"sequence\": \"5\",\n" +
      "            \"id\": \"BV20028271\",\n" +
      "            \"name\": \"长安站\",\n" +
      "            \"location\": \"120.658258,31.127242\"\n" +
      "          },\n" +
      "          {\n" +
      "            \"sequence\": \"24\",\n" +
      "            \"id\": \"BV20028418\",\n" +
      "            \"name\": \"新城花园(吴江)\",\n" +
      "            \"location\": \"120.689331,31.15692\"\n" +
      "          },\n" +
      "          {\n" +
      "            \"sequence\": \"25\",\n" +
      "            \"id\": \"BV20028152\",\n" +
      "            \"name\": \"山湖东路口\",\n" +
      "            \"location\": \"120.689461,31.152195\"\n" +
      "          },\n" +
      "          {\n" +
      "            \"sequence\": \"1\",\n" +
      "            \"id\": \"BV20028197\",\n" +
      "            \"name\": \"喜庆苑\",\n" +
      "            \"location\": \"120.630445,31.119342\"\n" +
      "          },\n" +
      "          {\n" +
      "            \"sequence\": \"2\",\n" +
      "            \"id\": \"BV20028538\",\n" +
      "            \"name\": \"联杨小区东\",\n" +
      "            \"location\": \"120.635129,31.120956\"\n" +
      "          },\n" +
      "          {\n" +
      "            \"sequence\": \"3\",\n" +
      "            \"id\": \"BV20028433\",\n" +
      "            \"name\": \"联杨新村\",\n" +
      "            \"location\": \"120.635237,31.123992\"\n" +
      "          },\n" +
      "          {\n" +
      "            \"sequence\": \"4\",\n" +
      "            \"id\": \"BV20028302\",\n" +
      "            \"name\": \"长安花苑小学\",\n" +
      "            \"location\": \"120.654354,31.126562\"\n" +
      "          },\n" +
      "          {\n" +
      "            \"sequence\": \"5\",\n" +
      "            \"id\": \"BV20028271\",\n" +
      "            \"name\": \"长安站\",\n" +
      "            \"location\": \"120.658258,31.127242\"\n" +
      "          },\n" +
      "          {\n" +
      "            \"sequence\": \"24\",\n" +
      "            \"id\": \"BV20028418\",\n" +
      "            \"name\": \"新城花园(吴江)\",\n" +
      "            \"location\": \"120.689331,31.15692\"\n" +
      "          },\n" +
      "          {\n" +
      "            \"sequence\": \"25\",\n" +
      "            \"id\": \"BV20028152\",\n" +
      "            \"name\": \"山湖东路口\",\n" +
      "            \"location\": \"120.689461,31.152195\"\n" +
      "          }\n" +
      "        ]\n" +
      "      }\n" +
      "    ]\n" +
      "  }\n" +
      "}";
  Future futureData;

  @override
  void initState() {
    futureData = getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<BusStationDetalEntity>(
        future: futureData,
        builder: (context, data) {
          if (data.hasData) {
            if (data.data == null)
              return InkWell(
                child: Text("点击数据存储"),
                onTap: () => {_shapeDataWidget(busdata)},
              );
            Future.delayed(Duration.zero).then((e) {
              ProviderUtils.Pro<BusProvider>(context).setBusStationDetal(data.data);
              ProviderUtils.Pro<BusProvider>(context)
                  .setBusStationDetalResultBuslinesBusstop(data.data.result.buslines[0].busstops);
            });
          } else {
            return noDataText();
          }
          return Container(
            padding: EdgeInsets.all(16),
            color: CommonColors.grayBg,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  Offstage(
                    offstage: ProviderUtils.Pro<BusProvider>(context).busStationDetalEntity != null ? true : false,
                    child: InkWell(
                      child: Text("点击数据存储"),
                      onTap: () => {_shapeDataWidget(busdata)},
                    ),
                  ),
                  BusHeadPage(),
                  BusMapBottomPage(),
                ],
              ),
            ),
          );
        });
  }

  void _shapeDataWidget(String busdata) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    BusStationDetalEntity busStationDetalEntity = BusStationDetalEntity.fromJson(jsonDecode(busdata));
    ToastOk.show(msg: busStationDetalEntity.reason);
    prefs.setString("busdata", jsonEncode(busStationDetalEntity).toString());
    //所有初始值的，应该放在子布局加载前，子布局只是用Consumer 获取
    Future.delayed(Duration.zero).then((e) {
      ProviderUtils.Pro<BusProvider>(context).setBusStationDetal(busStationDetalEntity);
      ProviderUtils.Pro<BusProvider>(context)
          .setBusStationDetalResultBuslinesBusstop(busStationDetalEntity.result.buslines[0].busstops);
    });
  }

  Future<BusStationDetalEntity> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("busdata") != null
        ? BusStationDetalEntity.fromJson(jsonDecode(prefs.getString("busdata")))
        : null;
  }
}
