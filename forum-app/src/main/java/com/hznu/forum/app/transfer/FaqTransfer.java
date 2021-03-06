package com.hznu.forum.app.transfer;

import com.hznu.forum.api.request.faq.FaqSaveFaqRequest;
import com.hznu.forum.api.response.faq.FaqHotsResponse;
import com.hznu.forum.api.response.faq.FaqInfoResponse;
import com.hznu.forum.api.response.faq.FaqUserPageResponse;
import com.hznu.forum.api.vo.SolutionVO;
import com.hznu.forum.api.vo.TagVO;
import com.hznu.forum.app.support.LoginUserContext;
import com.hznu.forum.common.enums.AuditStateEn;
import com.hznu.forum.common.enums.ContentTypeEn;
import com.hznu.forum.common.enums.PostsCategoryEn;
import com.hznu.forum.common.support.DateUtil;
import com.hznu.forum.common.support.SafesUtil;
import com.hznu.forum.domain.entity.Comment;
import com.hznu.forum.domain.entity.Faq;
import com.hznu.forum.domain.entity.Tag;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author LIN
 * @create 2021/11/1
 * @desc
 **/
public class FaqTransfer {

    public static FaqInfoResponse toFaqInfoResponse(Faq faq) {
        if (faq == null) {
            return null;
        }
        FaqInfoResponse faqInfoResponse = new FaqInfoResponse();
        faqInfoResponse.setAuditState(faq.getAuditState().getValue());
        faqInfoResponse.setTitle(faq.getTitle());
        faqInfoResponse.setMarkdownContent(faq.getMarkdownContent());
        faqInfoResponse.setHtmlContent(faq.getHtmlContent());
        faqInfoResponse.setTags(SafesUtil.ofSet(faq.getTags()).stream().map(tag -> {
            return TagVO.builder()
                    .id(tag.getId())
                    .name(tag.getName())
                    .build();
        }).collect(Collectors.toList()));
        faqInfoResponse.setViews(faq.getViews());
        faqInfoResponse.setApprovals(faq.getApprovals());
        faqInfoResponse.setComments(faq.getComments());
        faqInfoResponse.setId(faq.getId());
        faqInfoResponse.setCreateAt(faq.getCreateAt());
        faqInfoResponse.setUpdateAt(faq.getUpdateAt());
        faqInfoResponse.setAuthorId(faq.getAuthor().getId());
        faqInfoResponse.setAuthorAvatar(faq.getAuthor().getAvatar());
        faqInfoResponse.setAuthorNickname(faq.getAuthor().getNickname());
        return faqInfoResponse;
    }

    public static List<FaqUserPageResponse> toFaqUserPageResponses(List<Faq> faqs, List<Comment> comments) {
        return SafesUtil.ofList(faqs).stream().map(faq -> {
            SolutionVO solution = null;
            for (Comment comment : comments) {
                if (comment.getId().equals(faq.getSolutionId())) {
                    solution = SolutionVO.builder()
                            .content(comment.getContent())
                            .id(comment.getId())
                            .build();
                }
            }
            return FaqUserPageResponse.builder()
                    .category(PostsCategoryEn.FAQ.getValue())
                    .auditState(faq.getAuditState().getDesc())
                    .updateAt(DateUtil.toyyyyMMddHHmmss(faq.getUpdateAt()))
                    .categoryDesc(PostsCategoryEn.FAQ.getDesc())
                    .authorAvatar(faq.getAuthor().getAvatar())
                    .authorId(faq.getAuthor().getId())
                    .authorNickname(faq.getAuthor().getNickname())
                    .comments(faq.getComments())
                    .createAt(DateUtil.toyyyyMMddHHmmss(faq.getCreateAt()))
                    .id(faq.getId())
                    .introduction(faq.getMarkdownContent())
                    .tags(SafesUtil.ofSet(faq.getTags()).stream().map(tag -> {
                        return TagVO.builder()
                                .id(tag.getId())
                                .name(tag.getName())
                                .build();
                    }).collect(Collectors.toList()))
                    .title(faq.getTitle())
                    .views(faq.getViews())
                    .approvals(faq.getApprovals())
                    .solution(solution)
                    .solutionDesc(solution == null ? "?????????" : "?????????")
                    .build();
        }).collect(Collectors.toList());
    }

    public static Faq toFaq(FaqSaveFaqRequest request, Set<Tag> selectTags, Boolean update) {
        Faq faq = Faq.builder().build();
        faq.setId(request.getId());
        faq.setContentType(ContentTypeEn.getEntity(request.getContentType()));
        faq.setHtmlContent(request.getHtmlContent());
        faq.setMarkdownContent(request.getMarkdownContent());
        faq.setTags(selectTags);
        faq.setTitle(request.getTitle());
        faq.setAuthor(LoginUserContext.getUser());
        faq.setAuditState(AuditStateEn.PASS);

        if (!update) {
            faq.setSolutionId(0L);
            faq.setViews(0L);
            faq.setApprovals(0L);
            faq.setComments(0L);
        }

        return faq;
    }

    public static List<FaqHotsResponse> FaqHotsResponses(List<Faq> faqs) {
        List<FaqHotsResponse> res = new ArrayList<>();

        SafesUtil.ofList(faqs).forEach(faq -> {
            res.add(FaqHotsResponse.builder()
                    .createAt(DateUtil.toyyyyMMdd(faq.getCreateAt()))
                    .id(faq.getId())
                    .title(faq.getTitle())
                    .build());
        });

        return res;
    }
}
