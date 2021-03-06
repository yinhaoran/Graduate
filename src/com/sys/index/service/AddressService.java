package com.sys.index.service;

import java.util.List;

import com.sys.dao.ShipAddressDao;
import com.sys.entity.ShipAddress;
import com.sys.impl.ShipAddressImpl;

public class AddressService {
	
	public List<ShipAddress> getAddress(String userid){
		ShipAddressDao sad = new ShipAddressImpl();
		ShipAddress address = new ShipAddress();
		address.setUserid(userid);
		return sad.findAllShipAddress(address);
	}
	
	public ShipAddress getDefAddrByUserid(String userid) {
		ShipAddressDao sad = new ShipAddressImpl();
		ShipAddress address = new ShipAddress();
		address.setUserid(userid);
		//address.setSign("1");
		List<ShipAddress> list =  sad.findAllShipAddress(address);
		return list.get(0);
	}
	
	
	
	public boolean updateSign(String addressid){
		ShipAddressDao sad = new ShipAddressImpl();
		List<ShipAddress> list = sad.findAllShipAddress(new ShipAddress());
		for (ShipAddress shipAddress : list) {
			if("1".equals(shipAddress.getSign())){
				shipAddress.setSign("0");
				sad.updateShipAddress(shipAddress);
			}
		}
		ShipAddress s = sad.getShipAddressById(addressid);
		s.setSign("1");
		int row = sad.updateShipAddress(s);
		if(row > 0){
			return true;
		}
		return false;
	}
	
	
	public boolean addAddress(ShipAddress shipAddress){
		ShipAddressDao sad = new ShipAddressImpl();
		int row = sad.addShipAddress(shipAddress);
		if(row > 0){
			return true;
		}
		return false;
	}
	
	public boolean updateAddress(ShipAddress shipAddress){
		ShipAddressDao sad = new ShipAddressImpl();
		ShipAddress s = sad.getShipAddressById(shipAddress.getAddressid());
		shipAddress.setSign(s.getSign());
		int row = sad.updateShipAddress(shipAddress);
		if(row > 0){
			return true;
		}
		return false;
	}
	
	public boolean deleteAddress(String addressid){
		ShipAddressDao sad = new ShipAddressImpl();
		int row = sad.deleteShipAddress(addressid);
		if(row > 0){
			return true;
		}
		return false;
	}
	
	public ShipAddress findAddress(String addressid){
		ShipAddress add = new ShipAddress();
		add.setAddressid(addressid);
		ShipAddressDao sad = new ShipAddressImpl();
		List<ShipAddress> list = sad.findAllShipAddress(add);
		return list.get(0);
	}
	
	public ShipAddress findAddress(ShipAddress address){
		ShipAddressDao sad = new ShipAddressImpl();
		List<ShipAddress> list = sad.findAllShipAddress(address);
		return list.get(0);
	}
}
