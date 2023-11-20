package servlets.event.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

import servlets.event.domain.CouponDTO;
import servlets.event.domain.HaveCouponDTO;

public class EventCouponDAO implements IEventCoupon {

	// 쿠폰 발급
	public int setCoupon(Connection conn, HaveCouponDTO coupon) throws SQLException {
	    String sql = "INSERT INTO have_coupon (coupon_no, member_no, issue_date, expiry_date, used) VALUES (?, ?, ?, ?, ?)";
	    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setInt(1, coupon.getCoupon_no());
	        pstmt.setInt(2, coupon.getMember_no());
	        pstmt.setDate(3, coupon.getIssue_date());
	        pstmt.setDate(4, coupon.getExpiry_date());
	        pstmt.setInt(5, coupon.getUsed());
	        return pstmt.executeUpdate();
	    }
	}
	
	// 쿠폰 확인
	public CouponDTO getCoupon(Connection conn, int coupon_no) throws SQLException {
	    String sql = "SELECT * FROM coupon WHERE coupon_no = ?";
	    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setInt(1, coupon_no);
	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	            CouponDTO coupon = new CouponDTO();
	            coupon.setCoupon_no(rs.getInt("coupon_no"));
	            coupon.setCoupon_name(rs.getString("coupon_name"));
	            coupon.setDiscount(rs.getInt("discount"));
	            coupon.setDelivery_type(rs.getInt("delivery_type"));
	            coupon.setDuplication(rs.getInt("duplication"));
	            coupon.setUse_month(rs.getInt("use_month"));
	            coupon.setMin_price(rs.getInt("min_price"));
	            coupon.setMax_discount(rs.getInt("max_discount"));
	            return coupon;
	        }
	    }
	    return null;
	}
	
	
}


