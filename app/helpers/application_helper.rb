module ApplicationHelper
  def default_meta_tags
    {
      site: 'ハビトラ',
      title: '習慣の積み重ねでできた人生をより良いものにするためにサポートするサービス',
      reverse: true,
      charset: 'utf-8',
      description: 'ハビトラでは、SNSのように友人や家族と励まし合いながら習慣化を目指すことができます。',
      keywords: '習慣、管理、共有、成長',
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: image_url('favicon.png') },
        { href: image_url('ogp.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' },
      ],
      og:{
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        local: 'ja-JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@55bRyota110629',
        image: image_url('ogp.png')
      }
    }
  end
end
