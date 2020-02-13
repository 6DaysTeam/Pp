package com.sixdays.userMember.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

import com.sixdays.board.model.vo.Board;
import com.sixdays.p_board.model.vo.Photoes;

public class p_Board extends Board implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6616993412823354621L;

	
	private ArrayList<Photoes> phtoList;


	public p_Board() {	}

	
}
