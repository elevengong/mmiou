	function images($field, $value, $content_array = '') {
		//取得图片列表
		if($content_array)
		{
		   $pictures = $content_array;
		}else{
		   $pictures = $_POST[$field.'_url'];
		}
		
		//取得图片说明
		$pictures_alt = isset($_POST[$field.'_alt']) ? $_POST[$field.'_alt'] : array();
		$array = $temp = array();
		if(!empty($pictures)) {
			foreach($pictures as $key=>$pic) {
				$temp['url'] = $pic;
				$temp['alt'] = str_replace(array('"',"'"),'`',$pictures_alt[$key]);
				$array[$key] = $temp;
			}
		}
		$array = array2string($array);
		return $array;
	}
