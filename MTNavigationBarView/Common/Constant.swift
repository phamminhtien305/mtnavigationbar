//
//  Constant.swift
//  BaseProject
//
//  Created by  on 8/9/16.
//  Copyright © 2016 framgia. All rights reserved.
//

import Foundation
import UIKit

let APPDELEGATE = UIApplication.shared.delegate

enum MyAppLication {
    static let applicationName = "Books"
    static let version = (Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") ?? "0") as! String
    static let defaultNewVersionIntroduction = "The new version is faster and more reliable then ever. Go to the App Store to get the update and find out what's new."
    static let navigationBarHeight:CGFloat = DeviceManager.DeviceType.IS_IPHONE_X ? 80 : 60
    
    static let PopOverContentViewSize = CGSize(width: (min(DeviceManager.getWinSize().width, DeviceManager.getWinSize().height) - 35) * 4 / 5 + 40, height: min(DeviceManager.getWinSize().width, DeviceManager.getWinSize().height) - 150)
}

enum PLaceholder {
    static let GenrePlaceHolder = UIImage(named: "border")
    static let BookPlaceHolder = UIImage(named: "bookcover_placeholder")
}

class Quotations {
    private var _index = 0
    private let quotas =  [[
        "description_vn":"Vào khoảng khắc mà chúng ta thuyết phục đứa trẻ, bất cứ đứa trẻ nào, bước qua bậc thềm ấy, bậc thềm màu nhiệm dẫn vào thư viện, ta thay đổi cuộc sống của nó mãi mãi, theo cách tốt đẹp hơn.",
        "description_en":"At the moment that we persuade a child, any child, to cross that threshold, that magic threshold into a library, we change their lives forever, for the better",
        "author":"Barack Obama"
        ],[
            "description_vn" : "Hãy đọc một giờ mỗi ngày về lĩnh vực bạn đã lựa chọn. Điều này tương đương khoảng một cuốn sách mỗi tuần, năm mươi cuốn sách mỗi năm, và sẽ đảm bảo cho thành công của bạn.",
            "description_en":"",
            "author":"Brian Tracy"
        ],[
            "description_vn":"Lời khuyên duy nhất mà một người có thể cho người khác về việc đọc sách là đừng theo lời khuyên nào, hãy đi theo bản năng của riêng mình, sử dụng lý lẽ của riêng mình, đi đến kết luận của riêng mình.",
            "description_en":"",
            "author":"Virginia Woolf"
        ],[
            "description_vn":"Thật thương thay cho người biết mình thích nhất nhà hàng nào, nhưng không thích nhất một tác giả nào. Anh ta tìm thấy nơi ưa thích nhất để tẩm bổ thân thể, nhưng không có nơi ưa thích nhất để tẩm bổ tâm hồn!",
            "description_en":"",
            "author":"Jim Rohn"
        ],[
            "description_vn":"Người đọc quá nhiều và dùng tới bộ óc quá ít sẽ rơi vào thói quen suy nghĩ lười biếng.",
            "description_en":"Any man who reads too much and uses his own brain too little falls into lazy habits of thinking.",
            "author":"Albert Einstein"
        ],[
            "description_vn":"Một người không đọc sách chẳng hơn gì kẻ không biết đọc.",
            "description_en":"A person who won’t read has no advantage over one who can’t read.",
            "author":"Mark Twain"
        ],[
            "description_vn":"Hãy cẩn thận khi đọc sách về sức khỏe. Bạn có thể bỏ mạng vì một lỗi in ấn.",
            "description_en":"Be careful about reading health books. You may die of a misprint.",
            "author":"Mark Twain"
        ],[
            "description_vn":"Thiên nhiên và sách thuộc về những đôi mắt đã thấy chúng.",
            "description_en":"Nature and books belong to the eyes that see them.",
            "author":"Ralph Waldo Emerson"
        ],[
            "description_vn":"Chúng ta hãy dịu dàng và tử tế nâng niu những phương tiện của tri thức. Chúng ta hãy dám đọc, nghĩ, nói và viết.",
            "description_en":"Let us tenderly and kindly cherish, therefore, the means of knowledge. Let us dare to read, think, speak, and write.",
            "author":"John Adams"
        ],[
            "description_vn":"Sách hay, cũng như bạn tốt, ít và được chọn lựa; chọn lựa càng nhiều, thưởng thức càng nhiều.",
            "description_en":"Good books, like good friends, are few and chosen; the more select, the more enjoyable.",
            "author":"Louisa May Alcott"
        ],[
            "description_vn":"Một cuốn sách hay trên giá sách là một người bạn dù quay lưng lại nhưng vẫn là bạn tốt.",
            "description_en":"A good book on your shelf is a friend that turns its back on you and remains a friend.",
            "author":"Khuyết danh"
        ],[
            "description_vn":"Đọc sách hay cũng giống như trò truyện với các bộ óc tuyệt vời nhất của những thế kỷ đã trôi qua.",
            "description_en":"The reading of all good books is like a conversation with the finest minds of past centuries.",
            "author":"Rene Descartes"
        ],[
            "description_vn":"Chính từ sách mà những người khôn ngoan tìm được sự an ủi khỏi những rắc rối của cuộc đời.",
            "description_en":"It is from books that wise people derive consolation in the troubles of life.",
            "author":"Victor Hugo"
        ],[
            "description_vn":"Việc đọc rất quan trọng. Nếu bạn biết cách đọc, cả thế giới sẽ mở ra cho bạn.",
            "description_en":"Reading is important. If you know how to read then the whole world opens up to you",
            "author":"Barack Obama"
        ],[
            "description_vn":"Bạn càng đọc nhiều, bạn càng biết nhiều. Bạn càng học nhiều, bạn càng đi nhiều.",
            "description_en":"The more that you read, the more things you will know. The more that you learn, the more places you'll go.",
            "author":"Dr Seuss"
        ],[
            "description_vn":"Trong những cuốn sách ẩn chứa linh hồn của suốt chiều dài quá khứ.",
            "description_en":"In books lies the soul of the whole past time.",
            "author":"Thomas Carlyle"
        ],[
            "description_vn":"Bạn biết rằng bạn đã đọc một cuốn sách hay khi bạn giở đến trang cuối cùng và cảm thấy như mình vừa chia tay một người bạn.",
            "description_en":"You know you've read a good book when you turn the last page and feel as if you've lost a friend.",
            "author":"Khuyết danh"
        ],[
            "description_vn":"Như một đứa trẻ đọc truyện, điều tồi tệ là khi bạn đọc đến hồi kết, và thế rồi xong. Ý tôi là thật đau khổ khi truyện không còn thêm nữa.",
            "description_en":"The awful thing, as a kid reading, was that you came to the end of the story, and that was it. I mean, it would be heartbreaking that there was no more of it.",
            "author":"Robert Creeley"
        ],[
            "description_vn":"Chỉ trong sách, con người mới biết đến sự thật, tình yêu và cái đẹp hoàn hảo.",
            "description_en":"Only in books has mankind known perfect truth, love and beauty.",
            "author":"George Bernard Shaw"
        ],[
            "description_vn":"Những gì sách dạy chúng ta cũng giống như lửa. Chúng ta lấy nó từ nhà hàng xóm, thắp nó trong nhà ta, đem nó truyền cho người khác, và nó trở thành tài sản của tất cả mọi người.",
            "description_en":"The instruction we find in books is like fire. We fetch it from our neighbours, kindle it at home, communicate it to others, and it becomes the property of all.",
            "author":"Voltaire"
        ],[
            "description_vn":"Cuộc đời ta thay đổi theo hai cách: qua những người ta gặp và qua những cuốn sách ta đọc.",
            "description_en":"Our lives change in two ways :through the people we meet and the books we read.",
            "author":"Harvey MacKay"
        ],[
            "description_vn":"Không cần phải đốt sách để phá hủy một nền văn hóa. Chỉ cần buộc người ta ngừng đọc mà thôi.",
            "description_en":"You don't have to burn books to destroy a culture. Just get people to stop reading them.",
            "author":"Mahatma Gandhi"
        ],[
            "description_vn":"Nghệ thuật đọc là lướt qua một cách khôn ngoan.",
            "description_en":"The art of reading is to skip judiciously.",
            "author":"Alexander Hamilton"
        ],[
            "description_vn":"Khi họ đốt sách thì chính là họ cũng đang đốt cả loài người.",
            "description_en":"Whenever books are burned, men also in the end are burned.",
            "author":"Heinrich Heine"
        ],[
            "description_vn":"Tôi càng đọc, tôi càng suy ngẫm; và tôi càng được nhiều, tôi càng có thể tin chắc mình không biết điều gì.",
            "description_en":"The more I read, the more I meditate; and the more I acquire, the more I am enabled to affirm that I know nothing.",
            "author":"Voltaire"
        ],[
            "description_vn":"Sách là nguồn của cải quý báu của thế giới và là di sản xứng đáng của các thế hệ và các quốc gia.",
            "description_en":"Books are the treasured wealth of the world and the fit inheritance of generations and nations.",
            "author":"Henry David Thoreau"
        ],[
            "description_vn":"Nếu bạn có một thư viện và một khu vườn, bạn đã có mọi thứ bạn cần.",
            "description_en":"If you have a garden and a library, you have everything you need.",
            "author":"Marcus Tullius Cicero"
        ],[
            "description_vn":"Sách cũng giống như bạn hữu, nên ít và nên được lựa chọn kỹ.",
            "description_en":"Books like friends, should be few and well-chosen.",
            "author":"Samuel Johnson"
        ],[
            "description_vn":"Tôi thấy truyền hình rất có tính giáo dục. Mỗi khi ai đó bật ti vi lên, tôi lại sang phòng khác và đọc sách.",
            "description_en":"I find television very educating. Every time somebody turns on the set, I go into the other room and read a book.",
            "author":"Groucho Marx"
        ],[
            "description_vn":"Tôi đọc lồi cả mắt và vẫn không đọc được đủ tới một nửa... người ta càng đọc nhiều, người ta càng thấy còn nhiều điều cần phải đọc.",
            "description_en":"I read my eyes out and can't read half enough...the more one reads the more one sees we have to read.",
            "author":"John Adams"
        ],[
            "description_vn":"Một cuốn sách thực sự hay nên đọc trong tuổi trẻ, rồi đọc lại khi đã trưởng thành, và một lần nữa lúc tuổi già, giống như một tòa nhà đẹp nên được chiêm ngưỡng trong ánh bình minh, nắng trưa và ánh trăng.",
            "description_en":"A truly great book should be read in youth, again in maturity and once more in old age, as a fine building should be seen by morning light, at noon and by moonlight.",
            "author":"Robertson Davies"
        ],[
            "description_vn":"Người biết đọc nắm trong tay sức mạnh để khuếch đại bản thân mình, để nhân lên những cách mình tồn tại, để lấp đầy cuộc đời mình một cách đáng kể và thú vị.",
            "description_en":"Every man who knows how to read has it in his power to magnify himself, to multiply the ways in which he exists, to make his life full, significant and interesting.",
            "author":"Aldous Huxley"
        ],[
            "description_vn":"Sách không chỉ là sách, chúng là cuộc sống, là trái tim và hạt nhân của những thời đại đã qua, là lý do mà con người lao động và chết, là cốt lõi và tinh hoa của bao cuộc đời.",
            "description_en":"For books are more than books, they are the life, the very heart and core of ages past, the reason why men worked and died, the essence and quintessence of their lives.",
            "author":"Marcus Tullius Cicero"
        ],[
            "description_vn":"Một cuốn sách thực sự hay dạy tôi nhiều điều hơn là đọc nó. Tôi phải nhanh chóng đặt nó xuống, bắt đầu sống theo những điều nó chỉ dẫn. Điều tôi bắt đầu bằng cách đọc, tôi phải kết thúc bằng hành động.",
            "description_en":"A truly good book teaches me better than to read it. I must soon lay it down, and commence living on its hint. What I began by reading, I must finish by acting.",
            "author":"Henry David Thoreau"
        ],[
            "description_vn":"Sách là bạn tôi khi tôi không có bạn bè quanh mình.",
            "description_en":"Books were my friends when no friends were around.",
            "author":"Katrina Mayer"
        ],[
            "description_vn":"Người càng thông thái, càng đọc nhiều, và những người thông thái nhất là những người đọc nhiều nhất.\n The wiser a man becomes",
            "description_en":"the more he will read, and those who are wisest read most.",
            "author":"Hans Christian Andersen"
        ]]
    
    init() {
        self._index = Int(arc4random_uniform(UInt32(self.quotas.count)))
    }
    
    convenience init(_ index: Int) {
        self.init()
        self._index = index
    }
    
    func getListQuotations() -> [AnyObject] {
        return Array(self.quotas[_index..<self.quotas.count]) as [AnyObject]
    }
    
    func getQuoteDescriptionVN() -> String? {
        return "\"" + (self.quotas[_index]["description_vn"] ?? "") + "\""
    }
    
    func getQuoteDescriptionEN() -> String? {
        return "\"" + (self.quotas[_index]["description_en"] ?? "") + "\""
    }
    
    func getQuoteAuthor()-> String? {
        return "\""  + (self.quotas[_index]["author"] ?? "") + "\""
    }
}

