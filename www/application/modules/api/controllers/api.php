<?php
    require(APPPATH.'libraries/REST_Controller.php');
class Api extends REST_Controller  {

    function __construct()
    {
        parent::__construct();
    }

//lat lng

    function auth_get(){
        $this->carcontrol->authCar($this->get('car'));
    }

    function geoposition_get(){
        $this->carcontrol->updateCarPosition($this->get('car'),$this->get('lng'),$this->get('lat'));
        $this->response('',200);
    }

    function setcarstatus_get(){
        $this->carcontrol->updateCarStatus($this->get('car'),$this->get('status'),$this->get('value'),$this->get('position'));
    }


    function carinwork_get(){
        $this->carcontrol->setCarInWork($this->get('car'),$this->get('position'));
    }

    function caroutwork_get(){
        $this->carcontrol->setCarOutWork($this->get('car'),$this->get('position'));
    }


    function getorderlist_get(){
        $orderList = $this->carcontrol->getOrderList();
        $this->response($orderList);
    }

    function getcarorders_get(){
        $orderList = $this->carcontrol->getCarOrderList();
        $this->response($orderList);
    }

    function takeorder_get(){
        $this->carcontrol->assignOrderToCar($this->get('car'),$this->get('orderid'),$this->get('position'));
    }

    function user_delete()
    {
        $data = array('returned: '. $this->delete('id'));
        $this->response($data);
    }

}



