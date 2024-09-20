package com.wheelchair.wym.controller;

import com.wheelchair.wym.entity.DeliveryOrder;
import com.wheelchair.wym.service.IDeliveryOrderService;
import com.wheelchair.wym.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/delivery-orders")
public class DeliveryController {

    @Autowired
    private IDeliveryOrderService deliveryOrderService;
    @Autowired
    private IOrderService orderService;

    // 创建配送订单
    @PostMapping
    public ResponseEntity<String> createDeliveryOrder(@RequestBody DeliveryOrder deliveryOrder) {
        int result = deliveryOrderService.createDeliveryOrder(deliveryOrder);
        if (result > 0) {
            return ResponseEntity.ok("Delivery order created successfully");
        } else {
            return ResponseEntity.status(500).body("Failed to create delivery order");
        }
    }

    // 根据ID获取配送订单
    @GetMapping("/{id}")
    public ResponseEntity<DeliveryOrder> getDeliveryOrderById(@PathVariable Long id) {
        DeliveryOrder deliveryOrder = deliveryOrderService.getDeliveryOrderById(id);
        if (deliveryOrder != null) {
            return ResponseEntity.ok(deliveryOrder);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    // 获取所有配送订单
    @GetMapping
    public ResponseEntity<List<DeliveryOrder>> getAllDeliveryOrders() {
        List<DeliveryOrder> deliveryOrders = deliveryOrderService.getAllDeliveryOrders();
        return ResponseEntity.ok(deliveryOrders);
    }

    // 更新配送订单
    @PutMapping("/{id}")
    public ResponseEntity<String> updateDeliveryOrder(@PathVariable int id, @RequestBody DeliveryOrder deliveryOrder) {
        deliveryOrder.setdID(id);  // 设置ID，确保更新的是正确的订单
        int result = deliveryOrderService.updateDeliveryOrder(deliveryOrder);
        if (result > 0) {
            return ResponseEntity.ok("Delivery order updated successfully");
        } else {
            return ResponseEntity.status(500).body("Failed to update delivery order");
        }
    }

    // 删除配送订单
    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteDeliveryOrder(@PathVariable int id) {
        int result = deliveryOrderService.deleteDeliveryOrder(id);
        if (result > 0) {
            return ResponseEntity.ok("Delivery order deleted successfully");
        } else {
            return ResponseEntity.status(500).body("Failed to delete delivery order");
        }
    }

    @PostMapping("/updateOrderStatus")
    public String updateOrderStatus(@RequestParam("dID") Long dID, @RequestParam("d_status") Integer d_status, @RequestParam("uID") int uID, @RequestParam("cID") int cID, @RequestParam("o_status") Integer o_status) {
        int oID = orderService.findAnOrder(uID,cID);
        boolean success = deliveryOrderService.updateOrderStatus(dID, d_status) && orderService.updateOrderStatus(oID, o_status);
        return success ? "OK" : "FAIL";
    }
}
