package easeljs;

import haxe.extern.EitherType;

/**
 * The event listener type of EventDispatcher callback.
 * May be:
 *   1. Function.
 *   2. Object with callback property.
 * @author VolkovRA
 */
typedef Listener = EitherType<ListenerCallback, ListenerObject>;