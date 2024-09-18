package com.wheelchair.wym.controller;

import com.wheelchair.wym.entity.Repair;
import com.wheelchair.wym.service.IRepairService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/repairs")
public class RepairController {

    @Autowired
    private IRepairService repairService;

    // 创建维修申请
    @PostMapping
    public ResponseEntity<String> createRepair(@RequestBody Repair repair) {
        int result = repairService.createRepair(repair);
        if (result > 0) {
            return ResponseEntity.ok("Repair created successfully");
        } else {
            return ResponseEntity.status(500).body("Failed to create repair");
        }
    }

    // 根据ID获取维修申请
    @GetMapping("/{id}")
    public ResponseEntity<Repair> getRepairById(@PathVariable Long id) {
        Repair repair = repairService.getRepairById(id);
        if (repair != null) {
            return ResponseEntity.ok(repair);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    // 获取所有维修申请
    @GetMapping
    public ResponseEntity<List<Repair>> getAllRepairs() {
        List<Repair> repairs = repairService.getAllRepairs();
        return ResponseEntity.ok(repairs);
    }

    // 更新维修申请
    @PutMapping("/{id}")
    public ResponseEntity<String> updateRepair(@PathVariable int id, @RequestBody Repair repair) {
        repair.setId(id);  // 设置ID，确保更新的是正确的申请
        int result = repairService.updateRepair(repair);
        if (result > 0) {
            return ResponseEntity.ok("Repair updated successfully");
        } else {
            return ResponseEntity.status(500).body("Failed to update repair");
        }
    }

    // 删除维修申请
    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteRepair(@PathVariable Long id) {
        int result = repairService.deleteRepair(id);
        if (result > 0) {
            return ResponseEntity.ok("Repair deleted successfully");
        } else {
            return ResponseEntity.status(500).body("Failed to delete repair");
        }
    }
}
