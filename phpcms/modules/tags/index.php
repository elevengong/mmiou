<?php
defined('IN_PHPCMS') or exit('No permission resources.');
class index {
	public function __construct(){
		$this->db = pc_base::load_model('tags_model');
		$this->db_content = pc_base::load_model('tags_content_model');
	}
	public function init(){
		$tag = $_GET['tag'];
		$models = getcache('model', 'commons');
		$sitelist = getcache('sitelist', 'commons');
		$i=0;
		$siteid = intval($_GET['siteid']);
		$modelid = intval($_GET['modelid']);
		$orderby = intval($_GET['orderby']);
		foreach($models as $model_v){
			$model_arr .= 'model_arr['.$i++.'] = new Array("'.$model_v['modelid'].'","'.$model_v['name'].'","'.$model_v['siteid'].'");'."\n";
		}
		$page = isset($_GET['page']) && intval($_GET['page']) ? intval($_GET['page']) : 1;

		//echo $page."aaa";
		

		if($tag){
			//echo "aaa".$tag;
			if($this->db->get_one(array('tag'=>$tag))){
				
				//echo "aaa".$tag;
				$this->db->update(array('hits'=>'+=1'),"tag ='".$tag."'");
				
				$sql_arr = array('tag'=>$tag);
				if($siteid){
					$sql_arr['siteid'] = $siteid;

				}
				if($modelid){
					$sql_arr['modelid'] = $modelid;
				}
				if($orderby){
					$sql_ord = 'updatetime asc';
				}else{
					$sql_ord = 'updatetime desc';
				}
				//$tagdata = $this->db_content->listinfo($sql_arr,$sql_ord, $page, 1);
				//$pages = $this->db_content->pages;
				
				$tagdata = $this->db->list_tags($sql_arr,$sql_ord, $page, 20);
				$tags_pages = $this->db->tags_pages;
				
				$tagdata_thumb = $this->db->list_tags_thumb($tagdata);
				
				//print_r($tagdata);
				//echo "<br>";echo "<br>";echo "<br>";
				//print_r($tagdata_thumb);
				//exit;

				$total = $this->db->number;
			}else{
				showmessage('标签不存在！');
			}
			$CATEGORYS = getcache('category_content_'.$siteid,'commons');
			include template('tags', 'tag');
		}else{
			$tagdata = $this->db->listinfotags('','tagid desc', $page, 100);
			//print_r($tagdata);
			//$urlrules = getcache('urlrules','commons');
			//$urlrule = $urlrules[33];
			//define('URLRULE', $urlrule);
			
			//$pages = $this->db->pages;
			$wz_pages = $this->db->wz_pages;
			//echo $pages;
// 			$pages = str_replace('.html?page=', '_', $pages);
// 			$pages = str_replace('">', '.html">', $pages);
// 			$pages = str_replace('" class="a1', '.html" class="a1', $pages);
// 			$pages = str_replace('class="a1.html"', 'class="a1"', $pages);
// 			$pages = str_replace('tags_0.html', 'tags.html', $pages);

			$total = $this->db->number;
			include template('tags', 'index');
			
		}
		
	}
}