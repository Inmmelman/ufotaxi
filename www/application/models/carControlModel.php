<?php
class carControlModel extends CI_Model  {

    function __construct()
    {
        parent::__construct();
    }


    public function updateCarPosition($carId,$lng,$lat){
        $newCarGeoData = array('car_id' => $carId,
                               'lng' => $lng,
                               'lat' => $lat,
        );
        $this->db->insert('cars_geoposition',$newCarGeoData );

    }

    public function updateCarInSystem($carId,$carDate){
        if($this->_checkCarInSystem($carId)){
            $this->db->where('car_id',$carId);
            $this->db->update('car_in_system',$carDate);
        }else{
            $carDate['car_id'] =  $carId;
            $this->db->insert('car_in_system', $carDate);
        }
    }

    protected function _checkCarInSystem($carId){
        $query = $this->db->get_where('car_in_system', array('car_id' => $carId));
        $count = $query->num_rows();
        return $count;
    }

    public function updateCarStatus($carDate){
        $this->db->insert('cars_event_history', $carDate);
    }

    public function pushCarInStack($carId){
        $this->db->insert('stack', array('car_id' => $carId));
    }

    public function pullCarFromStack($carId){
        $this->db->delete('stack', array('car_id' => $carId));
    }

    public function getOrderList($carId = 0){
        $this->db->where('status',1);
        $resultSelect = $this->db->get('orders');

        return $resultSelect->result();
    }

    public function isCarInStack($carId){
        $this->db->where('car_id',$carId);
        $resultQuery = $this->db->get('stack');
        $carInSystem = $resultQuery->row();
        return $carInSystem ? true : false;
    }

    public function isCarInWork($carId){
        $this->db->where('car_id',$carId);
        $resultQuery = $this->db->get('car_in_system');
        $carInSystemobject = $resultQuery->row();
        return $carInSystemobject ->status == 2 ? true : false;
    }

    public function isCarReady($carId){

        return ($this->isCarInStack($carId) && $this->isCarInWork($carId));
    }



    public function updateOrder($orderId){
        $this->db->where('id',$orderId);
        $this->db->update('orders',array('status'=>2));
    }

    public function assignOrderToCar($carId,$orderId){
        $this->db->insert('order_to_car',array(
                                             'order_id' => $orderId,
                                             'car_id' => $carId
                                         ));
    }
}
