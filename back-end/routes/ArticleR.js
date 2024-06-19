const {createArticle,getArticle,getArticleByLocation,deleteArticle,updateArticle} =require('../controllers/Article')
const ArticleR=express.Router()

ArticleR.post("/article/create",createArticle())
ArticleR.get("/article/")