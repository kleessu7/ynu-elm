<script lang="ts" setup>
import {useRoute,} from "vue-router";

import axios from 'axios';
import {computed, onMounted, ref} from "vue";

const route = useRoute();
const orderId = route.params.goodsId; // 正确获取路由参数
const totalAmount=ref();

interface BusinessVo {
  businessAddress: string;
  businessExplain: string;
  businessId: number;
  businessImg: string;
  businessName: string;
  deliveryPrice: number;
  orderQuantity: number;
  orderTypeId: number;
  remarks: string;
  starPrice: number;
}

interface Food {
  goodsName: string;
  goodsIntrolain: string;
  goodsId: number;
  goodsCoverImg: string;
  businessName: string;
  originalPrice: number;
  sellingPrice: number;
}

interface OrderDetailetVo {
  foodId: number;
  food: Food;
  odId: number;
  orderId: number;
  quantity: number;
}

interface OrdersVo {
  businessId: number;
  businessVo: BusinessVo | null;
  daId: number;
  list: OrderDetailetVo[];
  orderDate: string;
  orderId: number;
  orderState: number;
  orderTotal: number;
  userId: string;
  show: boolean;
}

interface DeliveryAddress {
  contactName: string;
  contactSex: number;
  contactTel: string;
  address: string;
  daId: number;
}


  const deliveryAddressArr = ref<DeliveryAddress[]>([  
  {  
    contactName: "张三",  
    contactSex: 1,  
    contactTel: "13800000001",  
    address: "北京市朝阳区建国路99号",  
    daId: 1  
  },  
  {  
    contactName: "李四",  
    contactSex: 2,  
    contactTel: "13900000002",  
    address: "上海市浦东新区陆家嘴",  
    daId: 2  
  },  
  {  
    contactName: "王五",  
    contactSex: 1,  
    contactTel: "13700000003",  
    address: "广州市天河区珠江新城",  
    daId: 3  
  }  
]);  
const foods = ref<Food[]>([]);
const dialogVisible = ref(false);
const selectedAddress = ref<DeliveryAddress | null>(null);

const handleEdit = (index: number, row: DeliveryAddress) => {
  selectedAddress.value = row;
  dialogVisible.value = false;
};

const formatSex = (row: DeliveryAddress) => {
  return row.contactSex === 0 ? '先生' : '女士';
};

const tableData = computed(() => deliveryAddressArr.value);

const listDeliveryAddressByUserId = async () => {
  try {
    const response = await axios.get('/api/deliveryAddress/lists', {
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        
      }
    });

    if (response.data.code === 200) {
      return response.data.data; // This will be an array of DeliveryAddressVo objects
    } else {
      console.error('Error fetching delivery addresses:', response.data.message);
    }
  } catch (error) {
    console.error('Error making request:', error);
  }
};

const getOrdersById = async (orderId: number) => {
  try {
    const response = await axios.get(`/api/orders/${orderId}`, {
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
       
      },
    });

    return response.data;
  } catch (error) {
    console.error('Error fetching order:', error);
    throw error;
  }
};
const getBusinessById = async (businessId: number) => {
  try {
    const response = await axios.get(`/api/business/businesses/${businessId}`, {
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
       
      },
    });

    return response.data;
  } catch (error) {
    console.error('Error fetching business:', error);
    throw error;
  }
};
const fetchOrderDetails = async (orderId: number) => {
  try {
    const response = await axios.get('/api/orders/listsDetailet', {
      params: {orderId},
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        
      },
    });
    return response.data;
  } catch (error) {
    console.error('Error fetching order details:', error);
    throw error;
  }
};
const orders = ref<OrdersVo[]>([]);
console.log(route.params)
  totalAmount.value=Number(route.params.totalAmount);
  const fetchData = async () => {
    const goodsId = route.params.orderId; 
     
  try {
    const foodsResponse = await axios.get(`http://localhost:8080/goods/getinfo/${goodsId}`);
    if (foodsResponse && foodsResponse.data && foodsResponse.data.data) {
      foods.value= foodsResponse.data.data;
    }
    console.log(foods.value)

    // const foodsResponse = await axios.get(FOODS_API_URL);
    // if (foodsResponse && foodsResponse.data && foodsResponse.data.data) {
    //   foods.value = foodsResponse.data.data;
    // }
  } catch (error) {
    console.error('Error fetching data:', error);
  }
};
const fetchAndFillOrdersData = async () => {
  try {
    const ordersResponse = await getOrdersById(Number(orderId));
    // console.log('ordersResponse:', ordersResponse);
    if (ordersResponse.code === 200) {
      // 填充 businessVo 和订单详细信息
      let order = ordersResponse.data;
      let businessInfo = order.businessVo;
      let orderDetailsInfo = [];

      // 如果 businessVo 为 null，则通过 businessId 获取 businessVo
      if (businessInfo === null && order.businessId) {
        const businessResponse = await getBusinessById(order.businessId);
        if (businessResponse.code === 200 && businessResponse.data) {
          businessInfo = businessResponse.data;
        }
      }

      // 获取订单详细信息
      const orderDetailsResponse = await fetchOrderDetails(order.orderId);
      if (orderDetailsResponse.code === 200 && orderDetailsResponse.data) {
        orderDetailsInfo = orderDetailsResponse.data;
      }
      // console.log('orders:', orders);
      orders.value = [{...order, businessVo: businessInfo, list: orderDetailsInfo, show: false}];
    }
  } catch (error) {
    console.error('Error fetching and filling orders data:', error);
  }
};
const fetchAddresses = async () => {
  deliveryAddressArr.value = await listDeliveryAddressByUserId();
  // console.log('deliveryAddressArr:', deliveryAddressArr.value);
};
 
const changeA = () => {
  dialogVisible.value = true;
};

const handleClose = (done: () => void) => {
  done();
}

onMounted(async () => {
  await fetchData();
  // await fetchAddresses();
  
  if (deliveryAddressArr.value.length > 0) {
    selectedAddress.value = deliveryAddressArr.value[0];
  }
  else{
    selectedAddress.value =  {  
  contactName: "张三",  
  contactSex: 1, // 1 代表男性，2 代表女性  
  contactTel: "13800000000",  
  address: "北京市海淀区中关村大街100号",  
  daId: 1  
}
  }
});

</script>

<template>
  <body>
  <div class="w-full h-full">

    <!--header部分-->
    <header
        class="w-full h-24 font-medium bg-[#0097FFFF] text-white text-4xl fixed left-0 top-0 z-50 flex justify-center items-center">
      <p>确认订单</p>
    </header>

    <!--订单信息部分-->
    <div v-if="selectedAddress" class="w-full mt-24 bg-[#0097FFFF] box-border p-[2vw] text-white">
      <p class="text-2xl font-light">订单配送至：</p>
      <div class="w-full flex justify-between items-center font-bold select-none cursor-pointer my-1 mx-0">
        <p class="w-[90%] text-4xl">{{ selectedAddress.address }}</p>
        <svg height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg" @click="changeA">
          <path d="M15.54 11.29L9.88 5.64a1 1 0 0 0-1.42 0a1 1 0 0 0 0 1.41l4.95 5L8.46 17a1 1 0 0 0 0 1.41a1 1 0 0 0 .71.3a1 1 0 0 0 .71-.3l5.66-5.65a1 1 0 0 0 0-1.47Z"
                fill="currentColor"/>
        </svg>
      </div>
      <p class="text2xl">{{ selectedAddress.contactName }}{{ formatSex(selectedAddress) }}
        {{ selectedAddress.contactTel }}</p>
    </div>

    <el-dialog v-model="dialogVisible" :before-close="handleClose" align-center style="overflow: auto;" title="选择一个地址"
               width="80%">
      <el-table :data="tableData" style="width: 100%">
        <el-table-column label="姓名" prop="contactName"/>
        <el-table-column label="地址" prop="address"/>
        <el-table-column label="电话" prop="contactTel"/>
        <el-table-column :formatter="formatSex" label="性别" prop="contactSex"/>
        <el-table-column align="right" fixed="right">
          <template #default="scope">
            <el-button size="small" @click="handleEdit(scope.$index, scope.row)"
            >选择
            </el-button
            >
          </template>
        </el-table-column>
      </el-table>
    </el-dialog>

    

      <!--订单明细部分-->
      <ul class="w-full mb-7 text-sm">
      <li v-for="food in foods" :key="food.goodsId"
          class="w=full box-border mx-3 my-8 p-1.25/1 select-none flex justify-between items-center" style="margin-top: 20%;">
        <div class="flex box-content items-center">
          <img :src="food.goodsCoverImg" alt="食品图片" class="ml-3 w-1/3 h-1/3">
          <div class="ml-1.5">
            <h3 class="text-3xl mx-3 font-semibold text-gray-600">{{ food.goodsName }}</h3>
            <p class="text-2xl leading-loose mx-3 font-normal text-gray-500 mt-1">{{ food.goodsIntrolain }}</p>
            <p class="text-2xl text-gray-500 mx-3 font-normal mt-1">&#165;{{ totalAmount-3 }}</p>
          </div>
        </div>
      </li>
    </ul>
      <div class="w-full h-32 box-border p-[3vw] text-[#666666FF] flex justify-between items-center text-3xl">
        <p class="">配送费</p>
        <p class="">&#165;3</p>
      </div>

      <!--合计部分-->
      <RouterLink :to="`/payment/${orderId}`" class="block w-full h-full">
        <div class="w-full h-28 fixed left-0 bottom-0 flex">
          <div
              class="flex basis-2/3 bg-[#505051FF] text-white text-4xl font-bold select-none justify-center items-center">
            &#165;{{ totalAmount }}
          </div>
          <div
              class="flex basis-1/3 bg-[#38CA73FF] text-white text-4xl font-bold select-none cursor-pointer justify-center items-center">
            去支付
          </div>
        </div>
      </RouterLink>
    </div>

  </body>
</template>

<style scoped>

</style>
