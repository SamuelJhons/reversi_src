package com.renatus.reversi.command.level.utils {
	import flash.geom.Point;
	/**
	 *  
	 */
	public class Direction {
		
		public static const LEFT:Point 			= new Point(-1,  0);
		public static const LEFT_UP:Point 		= new Point(-1, -1);
		public static const UP:Point 			= new Point( 0, -1);
		public static const RIGHT_UP:Point		= new Point( 1, -1);
		public static const RIGHT:Point			= new Point( 1,  0);
		public static const RIGHT_DOWN:Point	= new Point( 1,  1);
		public static const DOWN:Point			= new Point( 0,  1);
		public static const LEFT_DOWN:Point		= new Point(-1,  1);
		
		public static const ALL:Array			=	[LEFT, LEFT_UP, UP, RIGHT_UP, RIGHT, RIGHT_DOWN, DOWN, LEFT_DOWN];
		public static const HORIZONTAL:Array	=	[LEFT, UP, RIGHT, DOWN];
		public static const DIAGONAL:Array		=	[LEFT_UP, RIGHT_UP, RIGHT_DOWN, LEFT_DOWN];
		
	}

}