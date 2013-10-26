<?php
class carControl {


    protected function _geoStrongToLatLng($geoString){

    }
    public function __construct(){
        $this->CI = &get_instance();
        $this->CI->load->model('carControlModel');
    }


    public function authCar($carId){
        $this->addCarEvent($carId,1,1);
    }

    public function updateCarPosition($carId,$position){
        $geoPosition = explode('_',$position);
        $this->CI->carControlModel->updateCarPosition($carId,$geoPosition[0],$geoPosition[1]);
    }

    protected function pushCarToStack($carId)
    {
        $this->CI->carControlModel->pushCarInStack($carId);
    }

    protected function  pullCarFromStack($carId){
        $this->CI->carControlModel->pullCarFromStack($carId);
    }

    public function setCarInWork($carId,$geoPosition){
        $this->updateCarStatus($carId,'online','2',$geoPosition);
        $this->addCarEvent($carId,3,1);
        $this->pushCarToStack($carId);
    }

    public function setCarOutWork($carId,$geoPosition){
        $this->updateCarStatus($carId,'online','1',$geoPosition);
        $this->addCarEvent($carId,4,1);
        $this->pullCarFromStack($carId);
    }

    public function updateCarStatus($carId,$status,$statusValue,$geoPosition){

        // TODO : отвязать жесткую связь
        $geoPosition = explode('_',$geoPosition);
        $newCarData = array(
            'lat' => $geoPosition[0],
            'lng' => $geoPosition[1],
            'status' =>$statusValue

        );

        $this->CI->carControlModel->updateCarInSystem($carId,$newCarData);

//        $this->addCarEvent($carId,1,1);
    }

    public function addCarEvent($carId,$evenType,$eventValue){
        $carData = array(
            'car_id' =>$carId,
            'event_type_id' => $evenType,
            'event_value' => $eventValue,
        );

        $this->CI->carControlModel->updateCarStatus($carData);
    }


    public function getOrderList(){
        $orderList =  $this->CI->carControlModel->getOrderList();
        $jsonOrderList = array();
        foreach ($orderList as $row)
        {
            $jsonOrderList[] = array(
                'from' => $row->from,
                'to' => $row->to,
                'arrive_time' => $row->arrive_time,
                'order_id' => $row->id
            );
        }

        return json_encode($jsonOrderList);
    }

    public function getCarOrderList(){

    }

    public function assignOrderToCar($carId,$orderId,$geoPosition){
        $this->updateCarPosition($carId,$geoPosition);
        if($this->CI->carControlModel->isCarReady($carId)){
            $this->updateCarStatus($carId,'online',3,$geoPosition);
            $this->addCarEvent($carId,5,$orderId);
            $this->CI->carControlModel->updateOrder($orderId);
            $this->CI->carControlModel->assignOrderToCar($carId,$orderId);
            return true;
        }
        return false;
    }



}