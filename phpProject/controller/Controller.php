<?php
class Controller
{
  protected $view;//attribut pour la classe view
  protected $model;//attribut pour la classe Model

  /* le constructeur prend un seul parametre.
  $value qui est un booleen qui est true pour dire que les pages qu'on veut inclure ne pas  vient pas de view ou model et false sinon */
  public function __construct()
  {
    include_once 'view/View.php';
    include_once 'model/Model.php';
    $this->view = new View();
    $this->model = new Model();
  }

  public function launch()
  {
    $this->view->my_website();
  }
  /*cette fonction verifie que le numero personnel entrer est correcte avant de le sumettre.
  le param $post est le tableau $_POST qu'il faut tester pour la validité .
  le param $submit :indice 'submit' dans $_POST
  */
 
  
  function pwd_generate($nb_car, $chaine = 'azertyuiopqsdfghjklmwxcvbn123456789')
{
    $nb_lettres = strlen($chaine) - 1;
    $generation = '';
    for($i=0; $i < $nb_car; $i++)
    {
        $pos = mt_rand(0, $nb_lettres);
        $car = $chaine[$pos];
        $generation .= $car;
    }
    return $generation;
}
  //charger de renvoyer les identifiant   par mail
  public function forgot($post,$forgot)
 {
   if ($this->model->is_empty($post,$forgot)) //si l'un des champs est vide alors reprendre
   {
     $this->view->setinfo("*champs du numero est vide veuillez ressayer");
     $this->view->my_website();
   }
   else if ($this->model->exist_np($post['identifiant_forgots'],"user")){ //verifie si le numero personnel saisi est valable .Si oui alors il redirige vers l'inscription
     $newpwd=$this->pwd_generate(rand(7,11));
     $this->model->edit_id($post['identifiant_forgots'],$newpwd);
     $message= "Identifiant :;
     votre mot de passe mot de passe provisoir est le : ".$newpwd.".
     Vous pouvez le changer une fois dans connecter a votre le menu param";
     $this->model->send_mail($post['identifiant_forgots'],"VOS IDENTIFIANTS",$message);
     $this->view->setinfo("*Consultez votre boite mail ! Nous avons envoyé vos identifiants",0);
     $this->view->my_website();
     exit();
   }
   else
   {
     $this->view->setinfo("*Numero inconnu !",0);
      $this->view->retry_connect_or_create();
      exit();
   }
 }

  public function forum($post, $action){
    if($action == "consulter"){//POST(forum_page, forum_user)
      $topics_per_page = 4;
      $number_of_topics = $this->model->getNumberOfTopics();
      $number_of_pages = ceil($number_of_topics/$topics_per_page);
      $topics = $this->model->getTopics($topics_per_page, $post['forum_page'], $post['forum_user']);
      $this->view->include_forum($topics, $number_of_pages, $post['forum_page']);
    }
    else if($action == "consult_your_topics"){//POST(your_topics_page, your_topics_author)
      $topics_per_page = 3;
      $number_of_topics = $this->model->getNumberOfYourTopics($post['your_topics_author']);
      $number_of_pages = ceil($number_of_topics/$topics_per_page);
      $topics = $this->model->getYourTopics($topics_per_page, $post['your_topics_page'], $post['your_topics_author']);
      $this->view->yourTopicsScreen($topics, $number_of_pages, $post['your_topics_page']);
    }
    else if($action == "add_favorite"){//POST(add_favorite_author, add_favorite_topic, last_forum_page ou last_your_topics_page)
      $this->model->addFavorite($post['add_favorite_author'], $post['add_favorite_topic']);
      if(isset($post['last_forum_page'])){
        $post['forum_page'] = $post['last_forum_page'];
        $post['forum_user'] = $post['add_favorite_author'];
        $this->forum($post, 'consulter');
      }
      else if(isset($post['last_your_topics_page'])){
        $post['your_topics_page'] = $post['last_your_topics_page'];
        $post['your_topics_author'] = $post['add_favorite_author'];
        $this->forum($post, 'consult_your_topics');
      }
    }
    else if($action == "consult_your_favorites"){//POST(your_favorites_page, your_favorites_author)
      $topics_per_page = 2;
      $number_of_topics = $this->model->getNumberOfYourFavorites($post['your_favorites_author']);
      $number_of_pages = ceil($number_of_topics/$topics_per_page);
      $topics = $this->model->getYourFavorites($topics_per_page, $post['your_favorites_page'], $post['your_favorites_author']);
      $this->view->yourFavoritesScreen($topics, $number_of_pages, $post['your_favorites_page']);
    }
    else if($action == "research_forum"){//POST(research_forum_content, research_forum_page, research_forum_user)
      $topics_per_page = 2;
      $number_of_topics = $this->model->getNumberOfForumFindings($post['research_forum_content']);
      $number_of_pages = ceil($number_of_topics/$topics_per_page);
      $topics = $this->model->getForumFindings($topics_per_page, $post['research_forum_page'], $post['research_forum_user'], $post['research_forum_content']);
      $this->view->researchForumScreen($topics, $number_of_pages, $post['research_forum_page'], $post['research_forum_content']);
    }
    else if($action == "research_your_topics"){//POST(research_your_topics_content, research_your_topics_page, research_your_topics_user)
      $topics_per_page = 2;
      $number_of_topics = $this->model->getNumberOfYourTopicsFindings($post['research_your_topics_content'], $post['research_your_topics_user']);
      $number_of_pages = ceil($number_of_topics/$topics_per_page);
      $topics = $this->model->getYourTopicsFindings($topics_per_page, $post['research_your_topics_page'], $post['research_your_topics_user'], $post['research_your_topics_content']);
      $this->view->researchYourTopicsScreen($topics, $number_of_pages, $post['research_your_topics_page'], $post['research_your_topics_content']);
    }
    else if($action == "research_your_favorites"){//POST(research_your_favorites_content, research_your_favorites_page, research_your_favorites_user)
      $topics_per_page = 2;
      $number_of_topics = $this->model->getNumberOfYourFavoritesFindings($post['research_your_favorites_content'], $post['research_your_favorites_user']);
      $number_of_pages = ceil($number_of_topics/$topics_per_page);
      $topics = $this->model->getYourFavoritesFindings($topics_per_page, $post['research_your_favorites_page'], $post['research_your_favorites_user'], $post['research_your_favorites_content']);
      $this->view->researchYourFavoritesScreen($topics, $number_of_pages, $post['research_your_favorites_page'], $post['research_your_favorites_content']);
    }
  }

  public function topic($post, $action){
    if($action == "consulter"){ //POST(topic_id, topic_page)
      $messages_per_page = 3;
      $number_of_messages = $this->model->getNumberOfMessages($post['topic_id']);
      $number_of_pages = ceil($number_of_messages/$messages_per_page);

      $topic = $this->model->getTopic($post['topic_id']);
      $messages = $this->model->getMessages($post['topic_id'], $messages_per_page, $post['topic_page']);

      $this->view->include_sujet($topic, $messages, $number_of_pages, $post['topic_page']);
    }
    else if($action == "add_topic"){//POST(add_topic_title (optionnel), add_topic_content (optionnel), add_topic_title_error (optionnel), add_topic_content_error (optionnel))
      if(isset($post['add_topic_title']) && isset($post['add_topic_content']) && isset($post['add_topic_title_error']) && isset($post['add_topic_content_error'])){
        $this->view->addTopicScreen($post['add_topic_title'], $post['add_topic_content'], $post['add_topic_title_error'], $post['add_topic_content_error']);
      }
      else{
        $this->view->addTopicScreen('','','','');
      }
    }
    else if($action == "create_topic"){//POST(topic_title, topic_content, topic_author)
      $add_topic_title_error = $this->model->checkAddTopicTitle($post['topic_title']);
      $add_topic_content_error = $this->model->checkAddTopicContent($post['topic_content']);

      if($add_topic_title_error == '' && $add_topic_content_error == ''){
        $post['message_topic_post'] = $this->model->createTopic($post['topic_title'], $post['topic_author']);
        $post['message_content'] = $post['topic_content'];
        $post['message_author'] = $post['topic_author'];
        $post['last_page_post'] = 1;
        $this->message($post, 'post_message');
      }
      else{
        $post['add_topic_title'] = $post['topic_title'];
        $post['add_topic_content'] = $post['topic_content'];
        $post['add_topic_title_error'] = $add_topic_title_error;
        $post['add_topic_content_error'] = $add_topic_content_error;
        $this->topic($post, 'add_topic');
      }

    }
  }

  //si le message n'est pas accepté, retourner false.
  public function message($post, $action){
    if($action == "add_message"){//POST(message_topic_add, last_page_add, add_message_content (optionnel), add_message_content_error (optionnel), message_quote_id (optionnel))
      if(isset($post['add_message_content']) && isset($post['add_message_content_error'])){
        echo exec('python/test.py '.$post['add_message_content'].' 2> log.txt', $output, $return_code);
        if($return_code == 0){
          return false;
        }
        if(isset($post['message_quote_id'])){
          $topic = $this->model->getTopic($post['message_topic_add']);
          $message_quote = $this->model->getMessage($post['message_quote_id']);
          $this->view->addMessageScreen($topic, $post['last_page_add'], $post['add_message_content'], $post['add_message_content_error'], $message_quote);
        }
        else{
          $topic = $this->model->getTopic($post['message_topic_add']);
          $this->view->addMessageScreen($topic, $post['last_page_add'], $post['add_message_content'], $post['add_message_content_error'], '');
        }
      }
      else{
        if(isset($post['message_quote_id'])){
          $topic = $this->model->getTopic($post['message_topic_add']);
          $message_quote = $this->model->getMessage($post['message_quote_id']);
          $this->view->addMessageScreen($topic, $post['last_page_add'], '', '', $message_quote);
        }
        else{
          $topic = $this->model->getTopic($post['message_topic_add']);
          $this->view->addMessageScreen($topic, $post['last_page_add'], '', '', '');
        }
      }
    }
    else if($action == "post_message"){//POST(message_content, message_author, message_topic_post, last_page_post, message_quote_id (optionnel))

      $add_message_content_error = $this->model->checkAddMessageContent($post['message_content']);

      if($add_message_content_error == ''){
        if(isset($post['message_quote_id'])){
          echo exec('../python/test.py '.$post['message_content'].' 2> log.txt', $output, $return_code);
          if($return_code == 0){
            return false;
          }
          $this->model->postMessage($post['message_content'], $post['message_author'], $post['message_topic_post'], $post['message_quote_id']);
          $post['topic_id'] = $post['message_topic_post'];
          $post['topic_page'] = $post['last_page_post'];
          $this->topic($post, 'consulter');
        }
        else{
          echo exec('../python/test.py '.$post['message_content']. ' 2> log.txt', $output, $return_code);
          if($return_code == 0){
            return false;
          }
          $this->model->postMessage($post['message_content'], $post['message_author'], $post['message_topic_post'], NULL);
          $post['topic_id'] = $post['message_topic_post'];
          $post['topic_page'] = $post['last_page_post'];
          $this->topic($post, 'consulter');
        }
      }
      else{
        $topic = $this->model->getTopic($post['message_topic_post']);
        $post['message_topic_add'] = $post['message_topic_post'];
        $post['last_page_add'] = $post['last_page_post'];
        $post['add_message_content'] = $post['message_content'];
        $post['add_message_content_error'] = $add_message_content_error;
        $this->message($post, 'add_message');
      }
    }
  }

  public function displayParam(){
    $this->view->include_param();
  }

  public function changePwd($old_pwd, $pwd1, $pwd2){
    $post['identifiant'] = $_SESSION['login'];
    $post['pwd'] = $old_pwd;
    //verify old_pwd
    if($this->model->login($post)){
      if($pwd1 == $pwd2){
        $this->model->changePwd($pwd1);
        $this->view->include_param_changed('success');
      }else{
        $this->view->include_param_changed('fail_new_pwd');
      }
    }else{
      $this->view->include_param_changed('fail_old_pwd');
    }
  }

  public function isAdmin(){
    if($this->model->getID() == 232323){

      return true;
    }else{
      return false;
    }
  }

  public function addStudent($name, $surname, $mail, $numero){
    $this->model->addStudent($name,$surname,$mail,$numero);
    $this->view->include_param_added('success');
  }

  public function displayReports($page_number, $page_number_t){
    $messages_per_page = 3;
    $number_of_messages = $this->model->getNumberTotalMessageReported(); //Total nb of messages
    $number_of_pages = ceil($number_of_messages/$messages_per_page);
    $messages = $this->model->getReportedMessages($messages_per_page, $page_number);

    $topics_per_page = 3;
    $number_of_topics = $this->model->getNumberTotalTopicsReported();
    $number_of_pages_t = ceil($number_of_topics/$topics_per_page);
    $topics = $this->model->getReportedTopics($topics_per_page, $page_number_t);

    $this->view->includeReports($messages,$number_of_pages,$page_number, $topics, $number_of_pages_t, $page_number_t);
  }

  public function deleteTopic($topic_id){
    $this->model->deleteTopic($topic_id);
  }

  public function deleteMessage($message_id){
    $this->model->deleteMessage($message_id);
  }

  public function unSignalMessage($message_id){
    $this->model->unSignalMessage($message_id);
  }

  public function unSignalTopic($message_id){
    $this->model->unSignalTopic($message_id);
  }

  public function signalTopicRedirect($post){
      $this->model->signalTopic($post['signal_topic']);
      $post['forum_user'] = $post['forum_signal_user'];
      $post['forum_page'] = $post['forum_signal_page'];
      $this->forum($post,'consulter');
  }

  public function signalMessageRedirect($post){
    $this->model->signalMessage($post['signal_message']);
    $post['topic_id'] = $post['topic_signal_id'];
    $post['topic_page'] = $post['topic_signal_page'];
    $this->topic($post,'consulter');
  }

  public function censorMessage($id){
    $this->model->censorMessage($id);
  }

}

?>