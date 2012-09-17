<?
/*---------------------------------------------------------------------------
* @Module Name: Feedback
* @Description: Feedback for LiveStreet
* @Version: 2.0
* @Author: Chiffa
* @LiveStreet Version: 1.0
* @File Name: PluginFeedback.class.php
* @License: CC BY-NC, http://creativecommons.org/licenses/by-nc/3.0/
*----------------------------------------------------------------------------
*/

if (!class_exists('Plugin')) {
	die('Hacking attemp!');
}

class PluginFeedback extends Plugin {

	/**
	 * Активация плагина
	 */
	public function Activate() {
		return true;
	}

	/**
	 * Деактивация плагина
	 */
	public function Deactivate() {
		return true;
	}

	/**
	 * Инициализация плагина
	 */
	public function Init() {
		/**
		 * Подключаем CSS
		 */
		$this->Viewer_AppendStyle(Plugin::GetTemplatePath(__CLASS__).'css/feedback.css');
		/**
		 * Подключаем JS
		 */
		$this->Viewer_AppendScript(Plugin::GetTemplatePath(__CLASS__).'js/feedback.js');
		/**
		 * Подключаем кнопку
		 */
		$this->Viewer_AddBlock('toolbar','toolbar_feedback.tpl',array('plugin'=>__CLASS__),-111);
	}

}
?>