<?php


  if (!isset($_SESSION)){
   session_start();
  }

  include_once 'controller/Controller.php';
  include_once 'controller/SignIn.php';
  $controller=new Controller();


  if(!isset($_POST))
  {
		$controller=new Controller();
    $controller->launch();//lance la page d'accueil
  }


	else if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  	$_SESSION['postdata']=$_POST;
  	session_write_close();

  	header('Location: ' . $_SERVER['REQUEST_URI'],true,303);
  	exit;
	}



	else if ($_SERVER['REQUEST_METHOD'] == 'GET'){
  	if (isset($_SESSION['postdata'])){
  		if (isset($_SESSION['postdata']['connexion']))//recuperation et redirection du formulaire de connection
    	{
      	$controller2 = new SignIn();
      	$controller2->login($_SESSION['postdata'],'connexion');
    	}
    if (isset($_SESSION['postdata']['inscription']))// recuperation et redirection du formulaire de creation du compte
    {
      $controller->create($_SESSION['postdata'],'inscription');
    }
    if (isset($_SESSION['postdata']['forgot'])) // recuperation et redirection du formulaire en cas d'oublie d'identifiants
    {
      $controller->forgot($_SESSION['postdata'],'forgot');
    }

    if (isset($_SESSION['postdata']['send_code']))
    {
        $controller->forgot($_SESSION['postdata'],'send_code');
    }

    //For the Forum
    if(isset($_SESSION['postdata']['forum_page']) && isset($_SESSION['postdata']['forum_user'])){
      $controller->forum($_SESSION['postdata'], 'consulter');
    }
    if(isset($_SESSION['postdata']['your_topics_page']) && isset($_SESSION['postdata']['your_topics_author'])){
      $controller->forum($_SESSION['postdata'], 'consult_your_topics');
    }
    if(isset($_SESSION['postdata']['add_favorite_author']) && isset($_SESSION['postdata']['add_favorite_topic']) && (isset($_SESSION['postdata']['last_forum_page']) || isset($_SESSION['postdata']['last_your_topics_page']))){
      $controller->forum($_SESSION['postdata'], 'add_favorite');
    }
    if(isset($_SESSION['postdata']['your_favorites_page']) && isset($_SESSION['postdata']['your_favorites_author'])){
      $controller->forum($_SESSION['postdata'] ,'consult_your_favorites');
    }
    if(isset($_SESSION['postdata']['research_forum_content']) && isset($_SESSION['postdata']['research_forum_page']) && isset($_SESSION['postdata']['research_forum_user'])){
      $controller->forum($_SESSION['postdata'] ,'research_forum');
    }
    if(isset($_SESSION['postdata']['research_your_topics_content']) && isset($_SESSION['postdata']['research_your_topics_page']) && isset($_SESSION['postdata']['research_your_topics_user'])){
      $controller->forum($_SESSION['postdata'] ,'research_your_topics');
    }
    if(isset($_SESSION['postdata']['research_your_favorites_content']) && isset($_SESSION['postdata']['research_your_favorites_page']) && isset($_SESSION['postdata']['research_your_favorites_user'])){
      $controller->forum($_SESSION['postdata'] ,'research_your_favorites');
    }


    //For topics
    if(isset($_SESSION['postdata']['topic_id']) && isset($_SESSION['postdata']['topic_page'])){
      $controller->topic($_SESSION['postdata'], 'consulter');
    }
    if(isset($_SESSION['postdata']['add_topic'])) {
      $controller->topic($_SESSION['postdata'], 'add_topic');
    }
    if(isset($_SESSION['postdata']['topic_title']) && isset($_SESSION['postdata']['topic_content']) && isset($_SESSION['postdata']['topic_author'])){
      $controller->topic($_SESSION['postdata'] ,'create_topic');
    }

    //For messages
    if(isset($_SESSION['postdata']['message_topic_add']) && isset($_SESSION['postdata']['last_page_add'])) { //$_SESSION['postdata']['message_quote_id'] (optionnel)
      $controller->message($_SESSION['postdata'] ,'add_message');
    }
    if(isset($_SESSION['postdata']['message_content']) && isset($_SESSION['postdata']['message_author']) && isset($_SESSION['postdata']['message_topic_post']) && isset($_SESSION['postdata']['last_page_post'])) { //$_SESSION['postdata']['message_quote_id'] (optionnel)
      $controller->message($_SESSION['postdata'], 'post_message');
    }

    //For parameters
    if(isset($_SESSION['postdata']['param'])){
      $controller->displayParam();
    }

    if(isset($_SESSION['postdata']['old_pwd']) && isset($_SESSION['postdata']['pwd1']) && isset($_SESSION['postdata']['pwd2'])){
      $controller->changePwd($_SESSION['postdata']['old_pwd'], $_SESSION['postdata']['pwd1'], $_SESSION['postdata']['pwd2']);
    }

    if(isset($_SESSION['postdata']['name']) && isset($_SESSION['postdata']['surname']) && isset($_SESSION['postdata']['mail']) && isset($_SESSION['postdata']['numero'])){
      $controller->addStudent($_SESSION['postdata']['name'], $_SESSION['postdata']['surname'], $_SESSION['postdata']['mail'], $_SESSION['postdata']['numero']);
    }

    //For reports
    if(isset($_SESSION['postdata']['report_page']) && isset($_SESSION['postdata']['report_page_t']) && !isset($_SESSION['postdata']['delete_topic']) && !isset($_SESSION['postdata']['delete_message']) && !isset($_SESSION['postdata']['unreport_message']) && !isset($_SESSION['postdata']['unreport_topic']) && !isset($_SESSION['postdata']['censor_message'])){
      $controller->displayReports($_SESSION['postdata']['report_page'], $_SESSION['postdata']['report_page_t']);
    }

    if(isset($_SESSION['postdata']['delete_topic']) && isset($_SESSION['postdata']['report_page']) && isset($_SESSION['postdata']['report_page_t'])){
      $controller->deleteTopic($_SESSION['postdata']['delete_topic']);
      $controller->displayReports($_SESSION['postdata']['report_page'], $_SESSION['postdata']['report_page_t']);
    }

    if(isset($_SESSION['postdata']['delete_message']) && isset($_SESSION['postdata']['report_page']) && isset($_SESSION['postdata']['report_page_t'])){
      $controller->deleteMessage($_SESSION['postdata']['delete_message']);
      $controller->displayReports($_SESSION['postdata']['report_page'], $_SESSION['postdata']['report_page_t']);
    }

    if(isset($_SESSION['postdata']['unreport_message']) && isset($_SESSION['postdata']['report_page']) && isset($_SESSION['postdata']['report_page_t'])){
      $controller->unSignalMessage($_SESSION['postdata']['unreport_message']);
      $controller->displayReports($_SESSION['postdata']['report_page'], $_SESSION['postdata']['report_page_t']);
    }

    if(isset($_SESSION['postdata']['unreport_topic']) && isset($_SESSION['postdata']['report_page']) && isset($_SESSION['postdata']['report_page_t'])){
      $controller->unSignalTopic($_SESSION['postdata']['unreport_topic']);
      $controller->displayReports($_SESSION['postdata']['report_page'], $_SESSION['postdata']['report_page_t']);
    }

    if(isset($_SESSION['postdata']['signal_topic']) && isset($_SESSION['postdata']['forum_signal_page']) && isset($_SESSION['postdata']['forum_signal_user'])){
      $controller->signalTopicRedirect($_POST);
    }

    if(isset($_SESSION['postdata']['signal_message']) && isset($_SESSION['postdata']['topic_signal_page']) && isset($_SESSION['postdata']['topic_signal_id'])){
      $controller->signalMessageRedirect($_POST);
    }

    if(isset($_SESSION['postdata']['censor_message']) && isset($_SESSION['postdata']['report_page']) && isset($_SESSION['postdata']['report_page_t'])){
      $controller->censorMessage($_SESSION['postdata']['censor_message']);
      $controller->displayReports($_SESSION['postdata']['report_page'], $_SESSION['postdata']['report_page_t']);
    }

  	}
  	else{
  		header('http/1.1 303 see other');
  		header ("Location: $_SERVER[HTTP_REFERER]" );
  	}
  	}
  ?>
