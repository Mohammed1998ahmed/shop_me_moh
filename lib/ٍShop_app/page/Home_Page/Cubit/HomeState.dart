import 'package:flutter/physics.dart';

abstract class HomeStates {}

class InitHomeStates extends HomeStates {}

class ChangIndex extends HomeStates {}

class LodingHome extends HomeStates {}

class SuccuflyHome extends HomeStates {}

class ErrorHome extends HomeStates {}

class BoolISFavorite extends HomeStates {}

class LodingFavorite extends HomeStates {}

class SuccuflyFavorite extends HomeStates {}

class ErrorFavorite extends HomeStates {}

class IsListToGrid extends HomeStates {}

class LodingGetFavorite extends HomeStates {}

class SuccuflyGetFavorite extends HomeStates {}

class ErrorGetFavorite extends HomeStates {}
