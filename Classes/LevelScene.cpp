#include "LevelScene.h"

USING_NS_CC;

Scene *LevelScene::createScene() { return LevelScene::create(); }

static void problemLoading(const char *filename) {
  printf("Error while loading: %s\n", filename);
  printf("Depending on how you compiled you might have to add 'Resources/' in "
         "front of filenames in LevelScene.cpp\n");
}

bool LevelScene::init() {
  if (!Scene::init()) {
    return false;
  }

  auto visibleSize = Director::getInstance()->getVisibleSize();
  Vec2 origin = Director::getInstance()->getVisibleOrigin();

  return true;
}
