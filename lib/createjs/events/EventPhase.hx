package createjs.events;

/**
 * The EventPhase class provides values for property of the Event class.
 * @author VolkovRA
 */
@:enum abstract EventPhase(Int) to Int
{
	/**
	 * Starting from the top parent to the target.
	 */
	var CAPTURE = 1;
	
	/**
	 * Currently being dispatched from the target.
	 */
	var AT_TARGET = 2;
	
	/**
	 * From the target to the top parent.
	 */
	var BUBBLING = 3;
}