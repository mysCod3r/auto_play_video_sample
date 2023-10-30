import 'package:auto_play_video_sample/model/media_model.dart';

final List<VideoModel> videoPosts = [
  VideoModel(
    id: '1',
    contentText: 'Video model 1',
    videoUrl: 'https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4',
  ),
  VideoModel(
    id: '4',
    contentText: 'Video model 2',
    videoUrl: 'https://user-images.githubusercontent.com/28951144/229373709-603a7a89-2105-4e1b-a5a5-a6c3567c9a59.mp4',
  ),
  VideoModel(
    id: '7',
    contentText: 'Video model 3',
    videoUrl: 'https://user-images.githubusercontent.com/28951144/229373716-76da0a4e-225a-44e4-9ee7-3e9006dbc3e3.mp4',
  ),
  VideoModel(
    id: '10',
    contentText: 'Video model 4',
    videoUrl: 'https://user-images.githubusercontent.com/28951144/229373718-86ce5e1d-d195-45d5-baa6-ef94041d0b90.mp4',
  ),
  VideoModel(
    id: '12',
    contentText: 'Video model 5',
    videoUrl: 'https://user-images.githubusercontent.com/28951144/229373720-14d69157-1a56-4a78-a2f4-d7a134d7c3e9.mp4',
  ),
];

final List<PostMediaModel> allPosts = [
  VideoModel(
    id: '1',
    contentText: 'Video model 1',
    videoUrl: 'https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4',
  ),
  SoundModel(
    id: '2',
    contentText: 'Sound model 1',
    soundUrl: 'https://cdn.pixabay.com/audio/2022/08/31/audio_211a75cee4.mp3',
    imageUrl: 'https://fastly.picsum.photos/id/765/400/400.jpg?hmac=N-OebPM0dQrsDDsm-0ypaHwEjF2seamOK-og8vcwDMA',
  ),
  NoMediaModel(
    id: '3',
    contentText: 'No Media Model 1',
  ),
  VideoModel(
    id: '4',
    contentText: 'Video model 2',
    videoUrl: 'https://user-images.githubusercontent.com/28951144/229373709-603a7a89-2105-4e1b-a5a5-a6c3567c9a59.mp4',
  ),
  SoundModel(
    id: '5',
    contentText: 'Sound model 2',
    imageUrl: 'https://fastly.picsum.photos/id/1036/400/400.jpg?hmac=uE5O6tQtgloL39PEiGgqi0AOfH7mMyiTJvDHlUrmYtM',
    soundUrl: 'https://cdn.pixabay.com/audio/2022/11/11/audio_1c38e10a1a.mp3',
  ),
  NoMediaModel(
    id: '6',
    contentText: 'No Media Model 2',
    imageUrl: 'https://fastly.picsum.photos/id/517/400/400.jpg?hmac=saNFvNf3vMRHmDc_VH1_2whNv3g560-k5mBUDu48PXI',
  ),
  VideoModel(
    id: '7',
    contentText: 'Video model 3',
    videoUrl: 'https://user-images.githubusercontent.com/28951144/229373716-76da0a4e-225a-44e4-9ee7-3e9006dbc3e3.mp4',
  ),
  SoundModel(
    id: '8',
    contentText: 'Sound model 3',
    imageUrl: 'https://fastly.picsum.photos/id/821/400/400.jpg?hmac=dN89zU0qdoag7yL5lyGqzkHF6dDqHtEK2Q6DwsiMEwI',
    soundUrl: 'https://cdn.pixabay.com/audio/2023/03/10/audio_b9ec8e0883.mp3',
  ),
  NoMediaModel(
    id: '9',
    contentText: 'No Media Model 3',
    imageUrl: 'https://fastly.picsum.photos/id/216/400/400.jpg?hmac=mkrlCwfcoKEpKBm_iHGGj5fhm3mWC4Rsz49lRfJDMo4',
  ),
  VideoModel(
    id: '10',
    contentText: 'Video model 4',
    videoUrl: 'https://user-images.githubusercontent.com/28951144/229373718-86ce5e1d-d195-45d5-baa6-ef94041d0b90.mp4',
  ),
  SoundModel(
    id: '11',
    contentText: 'Sound model 4',
    imageUrl: 'https://fastly.picsum.photos/id/89/400/400.jpg?hmac=ZLlGK9eM2Yla2l6jJI5yDN5KnZndtl69p6wiE3IpXb8',
    soundUrl: 'https://cdn.pixabay.com/audio/2023/05/30/audio_a7b446c809.mp3',
  ),
  VideoModel(
    id: '12',
    contentText: 'Video model 5',
    videoUrl: 'https://user-images.githubusercontent.com/28951144/229373720-14d69157-1a56-4a78-a2f4-d7a134d7c3e9.mp4',
  ),
  SoundModel(
    id: '13',
    contentText: 'Sound model 5',
    imageUrl: 'https://fastly.picsum.photos/id/667/400/400.jpg?hmac=P7DonQtS3AObPeVCqniDzodFr6hAhmD_9tbp27TO-Ec',
    soundUrl: 'https://cdn.pixabay.com/audio/2023/08/26/audio_283bb586f1.mp3',
  ),
  VideoModel(
    id: '101',
    contentText: 'Video model 101',
    videoUrl:
        'https://zirvafilebucket.s3.eu-central-1.amazonaws.com/videos%2Ff0bc26e4-455c-4cae-b7bd-564a7a1262421697700299712024524.mp4',
  ),
  VideoModel(
    id: '102',
    contentText: 'Video model 102',
    videoUrl:
        'https://zirvafilebucket.s3.eu-central-1.amazonaws.com/videos%2F79e49ecc-b9f0-4463-8507-74d1c392faf81697061093944277198.mp4',
  ),
  VideoModel(
    id: '103',
    contentText: 'Video model 103',
    videoUrl:
        'https://zirvafilebucket.s3.eu-central-1.amazonaws.com/videos%2Fef687c14-228d-4f8e-affb-abba4ac3c4331697061078353703851.mp4',
  ),
  VideoModel(
    id: '104',
    contentText: 'Video model 104',
    videoUrl:
        'https://zirvafilebucket.s3.eu-central-1.amazonaws.com/videos%2F821850b0-36ee-40f6-9304-d2a1ad6fbc671697061062707111011.mp4',
  ),
  VideoModel(
    id: '105',
    contentText: 'Video model 105',
    videoUrl:
        'https://zirvafilebucket.s3.eu-central-1.amazonaws.com/videos%2F2357a14b-b321-42ab-85cc-d688a517d5471697061048216353117.mp4',
  ),
  VideoModel(
    id: '106',
    contentText: 'Video model 106',
    videoUrl:
        'https://zirvafilebucket.s3.eu-central-1.amazonaws.com/videos%2F4b52c819-a49b-4b14-b159-bddba246162a1697061026192353119.mp4',
  ),
  VideoModel(
    id: '107',
    contentText: 'Video model 107',
    videoUrl:
        'https://zirvafilebucket.s3.eu-central-1.amazonaws.com/videos%2F29a9471b-e3d5-47ae-86df-eea54839e8e71697061000726120931.mp4',
  ),
  VideoModel(
    id: '108',
    contentText: 'Video model 108',
    videoUrl:
        'https://zirvafilebucket.s3.eu-central-1.amazonaws.com/videos%2Fce37a59c-d159-4e89-89dd-88f69685753c1697060982742825352.mp4',
  ),
  VideoModel(
    id: '109',
    contentText: 'Video model 109',
    videoUrl:
        'https://zirvafilebucket.s3.eu-central-1.amazonaws.com/videos%2F686a76fd-278a-487f-ac65-5bd555bb99051697060963513429771.mp4',
  ),
  VideoModel(
    id: '110',
    contentText: 'Video model 110',
    videoUrl:
        'https://zirvafilebucket.s3.eu-central-1.amazonaws.com/videos%2F7c1b5c41-6dd7-4e48-bdd7-ff5ccf8e1c821697060946880817270.mp4',
  ),
  VideoModel(
    id: '111',
    contentText: 'Video model 111',
    videoUrl:
        'https://zirvafilebucket.s3.eu-central-1.amazonaws.com/videos%2Ff55241f9-4674-4074-9b62-894cb9dc1fc81697060932383205044.mp4',
  ),
  VideoModel(
    id: '112',
    contentText: 'Video model 112',
    videoUrl:
        'https://zirvafilebucket.s3.eu-central-1.amazonaws.com/videos%2F71c573ac-f018-4955-8461-120891c8c7b81697060912406472874.mp4',
  ),
  VideoModel(
    id: '113',
    contentText: 'Video model 113',
    videoUrl:
        'https://zirvafilebucket.s3.eu-central-1.amazonaws.com/videos%2Fd2de4250-8324-4e6e-83a6-2c38d88d27d81697060413487392774.mp4',
  ),
  VideoModel(
    id: '114',
    contentText: 'Video model 114',
    videoUrl:
        'https://zirvafilebucket.s3.eu-central-1.amazonaws.com/videos%2F55e10c90-3787-484f-a561-63eb8459a5fc1697060139312886586.mp4',
  ),
  VideoModel(
    id: '115',
    contentText: 'Video model 115',
    videoUrl:
        'https://zirvafilebucket.s3.eu-central-1.amazonaws.com/videos%2Fe8de16d7-bd01-45b3-bc26-92545b22320e1697060028713075196.mp4',
  ),
  VideoModel(
    id: '116',
    contentText: 'Video model 116',
    videoUrl:
        'https://zirvafilebucket.s3.eu-central-1.amazonaws.com/videos%2Fef687c14-228d-4f8e-affb-abba4ac3c4331697061078353703851.mp4',
  ),
  VideoModel(
    id: '117',
    contentText: 'Video model 117',
    videoUrl:
        'https://zirvafilebucket.s3.eu-central-1.amazonaws.com/videos%2F821850b0-36ee-40f6-9304-d2a1ad6fbc671697061062707111011.mp4',
  ),
  VideoModel(
    id: '118',
    contentText: 'Video model 118',
    videoUrl:
        'https://zirvafilebucket.s3.eu-central-1.amazonaws.com/videos%2F2357a14b-b321-42ab-85cc-d688a517d5471697061048216353117.mp4',
  ),
  VideoModel(
    id: '119',
    contentText: 'Video model 119',
    videoUrl:
        'https://zirvafilebucket.s3.eu-central-1.amazonaws.com/videos%2F4b52c819-a49b-4b14-b159-bddba246162a1697061026192353119.mp4',
  ),
  VideoModel(
    id: '120',
    contentText: 'Video model 120',
    videoUrl:
        'https://zirvafilebucket.s3.eu-central-1.amazonaws.com/videos%2F29a9471b-e3d5-47ae-86df-eea54839e8e71697061000726120931.mp4',
  ),
];
