<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="<%=request.getContextPath()%>/resources/index/node_modules/gridstack/dist/gridstack.min.css" rel="stylesheet"/>
<script src="${pageContext.request.contextPath}/resources/index/node_modules/gridstack/dist/gridstack-all.js"></script>
<style type="text/css">
	.grid-stack { background: #FAFAD2; }
	.grid-stack-item-content { background-color: #18BC9C; }
</style>
<div class="ks-lm-radius"></div>
<div class="grid-stack"></div>

<script type="text/javascript">
  var items = [
    {w: 12, h: 3, content: 'my first widget'}, // will default to location (0,0) and 1x1
    {w: 3, h: 3, content: 'another longer widget!'}, // will be placed next at (1,0) and 2x1
    {w: 3, h: 3, content: '호호호호'}, //el태그로 하면 우리 데이터 들어갈 수 잇어!@
    {w: 3, h: 3, content: '호호호호'},
    {w: 3, h: 3, content: '호호호호'}
  ];
  var grid = GridStack.init();
  grid.load(items);

</script>