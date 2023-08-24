package com.shop.util;

import java.sql.Connection;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

public enum ConnectionOracleUtil {
	
INSTANCE;
	
	private HikariDataSource ds;

	private ConnectionOracleUtil() {
		HikariConfig config = new HikariConfig();
		config.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		config.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:xe");
		
		config.setUsername("user1");
		config.setPassword("1234");
		config.addDataSourceProperty("cachePrepStmts", true);
		config.addDataSourceProperty("prepStmtCachesize", 250);
		config.addDataSourceProperty("prepStmtCacheSqlLimit", true);
		
		ds = new HikariDataSource(config);
	}
	
	public Connection getConnection() throws Exception{
		return ds.getConnection();
	}
	
}
