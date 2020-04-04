package easeljs.events;

/**
 * Event listener as some object.
 * An object with a handleEvent method.
 * This is an alternative for function callback.
 * @author VolkovRA
 */
typedef ListenerObject = 
{
	/**
	 * Event listener callback.
	 */
	var handleEvent:ListenerCallback;
}